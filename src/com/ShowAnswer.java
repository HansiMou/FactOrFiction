package com;

import com.google.cloud.datastore.Entity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
public class ShowAnswer extends HttpServlet {
    private static String FACT = "fact";
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute(FACT, req.getParameter(FACT));

        boolean guess = Boolean.parseBoolean((String) req.getAttribute("fact"));
        boolean fact = (boolean) req.getSession().getAttribute("Fact");

        Entity existing = (Entity) req.getSession().getAttribute("Entity");
        Entity.Builder taskBuilder = Entity.newBuilder(existing).set("AnswersCount", existing.getLong("AnswersCount")+1);
        if (guess == fact) {
            taskBuilder.set("CorrectAnswersCount", existing.getLong("CorrectAnswersCount")+1);
        }
        GetRandomStory.datastore.update(taskBuilder.build());

        req.getRequestDispatcher("showAnswer.jsp").forward(req, resp);
    }
}