package ua.goit.controller;

import ua.goit.models.Company;
import ua.goit.repository.CrudRepository;
import ua.goit.repository.RepositoryFactory;
import ua.goit.service.CompanyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/companies")
public class CompanyServlet extends HttpServlet {

    private CrudRepository<Long, Company> repository;

    @Override
    public void init() {
        repository = RepositoryFactory.of(Company.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String deleteId = req.getParameter("deleteId");
        if (deleteId != null) {
            Optional<Company> company = new CompanyService().readById(Company.class, Long.valueOf(deleteId));
            if (company.isPresent()) {
                System.out.println("Deleting entity: " + company.get());
                new CompanyService().deleteById(Company.class, Long.valueOf(deleteId));
            }
            resp.sendRedirect("/companies");
        } else {
            List<Company> companies = repository.findAll();
            req.setAttribute("companies", companies);
            req.getRequestDispatcher("/company/companies.jsp").forward(req, resp);
        }
    }
}
