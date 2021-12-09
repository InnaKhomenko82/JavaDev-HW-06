package ua.goit.controller;

import ua.goit.models.Developer;
import ua.goit.repository.CrudRepository;
import ua.goit.repository.RepositoryFactory;
import ua.goit.service.DeveloperService;
import ua.goit.util.HandleBodyUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/developers/*")
public class DeveloperServlet extends HttpServlet{
    private CrudRepository<Long, Developer> repository;

    public DeveloperServlet() {
        repository =  RepositoryFactory.of(Developer.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String[] split = req.getRequestURI().split("/");
        if (split.length==3 && "new".equals(split[2])){
            System.out.println("new");
            req.setAttribute("developer", new Developer());
            req.getRequestDispatcher("/developer/developer.jsp").forward(req, resp);
        }
        if (split.length==3){
            Developer developer = repository.findById(Long.valueOf(split[2])).get();
            req.setAttribute("developer", developer);
            req.getRequestDispatcher("/developer/developer.jsp").forward(req, resp);
        }
            String deleteId = req.getParameter("deleteId");
        if (deleteId != null) {
            Optional<Developer> developer = new DeveloperService().readById(Developer.class, Long.valueOf(deleteId));
            if (developer.isPresent()){
                System.out.println("Deleting entity: " + developer.get());
                new DeveloperService().deleteById(Developer.class, Long.valueOf(deleteId));
            }
            resp.sendRedirect("/developers");
        } else {
            List<Developer> developers = repository.findAll();
            req.setAttribute("developers", developers);
            req.getRequestDispatcher("/developer/developers.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("put");
        HandleBodyUtil.getModelFromStream(req.getInputStream(), Developer.class)
                .ifPresent(developer -> {repository.save(developer);});
        req.getRequestDispatcher("/developer/developer.jsp").forward(req, resp);
    }
}
