package com;

import com.google.cloud.datastore.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@SuppressWarnings("serial")
@WebServlet(name = "GetRandomStory", value="/getRandomStory")
public class GetRandomStory extends HttpServlet {
    private static String KIND = "story";
    private static String QUESTION = "Question";
    private static String ANSWER = "Answer";
    private static String FACT = "Fact";
    private static String ENTITY = "Entity";
    private static String BEATEN = "Beaten";

    private static List<Entity> allResults = new ArrayList<>();
    private static Random random;
    public static Datastore datastore;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (allResults.size() != 0) {
            Entity story = allResults.remove(random.nextInt(allResults.size()));
            HttpSession session = req.getSession();

            session.setAttribute(QUESTION, story.getString(QUESTION));
            session.setAttribute(ANSWER, story.getString(ANSWER));
            session.setAttribute(FACT, story.getBoolean(FACT));
            session.setAttribute(ENTITY, story);
            DecimalFormat decimalFormat=new DecimalFormat(".00");
            session.setAttribute(BEATEN, story.getLong("AnswersCount") == 0 ?
                    "N/A" : decimalFormat.format(100.0-100.0*story.getLong("CorrectAnswersCount")/story.getLong("AnswersCount")));

            req.getRequestDispatcher("getRandomStory.jsp").forward(req, resp);
        } else {
            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('No more stories in this session.');");
            out.println("</script>");
        }
    }

    @Override
    public void init() throws ServletException {
        if (allResults.size() == 0) {
            random = new Random();
            datastore = DatastoreOptions.getDefaultInstance().getService();
            Query<Entity> query = Query.newEntityQueryBuilder()
                    .setKind(KIND)
                    .build();

            QueryResults<Entity> results = datastore.run(query);

            while (results.hasNext()) {
                allResults.add(results.next());
            }
        }
    }
}