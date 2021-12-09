package ua.goit.controller;

import ua.goit.models.Skill;
import ua.goit.repository.CrudRepository;
import ua.goit.repository.RepositoryFactory;
import ua.goit.service.SkillService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

@WebServlet("/skills")
public class SkillServlet extends HttpServlet {

    private CrudRepository<Long, Skill> repository;

    public SkillServlet() {
        repository = RepositoryFactory.of(Skill.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String deleteId = req.getParameter("deleteId");

        if (deleteId != null) {
            Optional<Skill> skill = new SkillService().readById(Skill.class, Long.valueOf(deleteId));
            if (skill.isPresent()) {
                System.out.println("Deleting entity: " + skill.get());
                new SkillService().deleteById(Skill.class, Long.valueOf(deleteId));
            }
            resp.sendRedirect("/skills");
        } else {
            List<Skill> skills = repository.findAll();
            req.setAttribute("skills", skills);
            req.getRequestDispatcher("/skill/skills.jsp").forward(req, resp);
        }
    }
}
