package ua.goit.controller;

import ua.goit.models.Skill;
import ua.goit.repository.CrudRepository;
import ua.goit.repository.RepositoryFactory;
import ua.goit.service.SkillService;
import ua.goit.util.HandleBodyUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/skills/*")
public class SkillServlet extends HttpServlet {

    private CrudRepository<Long, Skill> repository;

    public SkillServlet() {
        repository = RepositoryFactory.of(Skill.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String [] split = req.getRequestURI().split("/");
        if (split.length==3 && "new".equals(split[2])){
            req.setAttribute("skill", new Skill());
            req.getRequestDispatcher("/skill/skill.jsp").forward(req, resp);
        }
        if (split.length==3){
            Skill skill = repository.findById(Long.valueOf(split[2])).get();
            req.setAttribute("skill", skill);
            req.getRequestDispatcher("/skill/skill.jsp").forward(req, resp);
        }
        String deleteId = req.getParameter("deleteId");
        if (deleteId != null) {
            Optional<Skill> skill = new SkillService().readById(Skill.class, Long.valueOf(deleteId));
            if (skill.isPresent()) {
                new SkillService().deleteById(Skill.class, Long.valueOf(deleteId));
            }
            resp.sendRedirect("/skills");
        } else {
            List<Skill> skills = repository.findAll();
            req.setAttribute("skills", skills);
            req.getRequestDispatcher("/skill/skills.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HandleBodyUtil.getModelFromStream(req.getInputStream(), Skill.class)
                .ifPresent(skill -> {repository.save(skill);});
        req.getRequestDispatcher("/skill/skill.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HandleBodyUtil.getModelFromStream(req.getInputStream(), Skill.class)
                .ifPresent(skill -> {repository.save(skill);});
        req.getRequestDispatcher("/skill/skill.jsp").forward(req, resp);
    }
}
