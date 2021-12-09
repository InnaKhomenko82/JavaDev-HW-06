package ua.goit.controller;

import ua.goit.models.Customer;
import ua.goit.repository.CrudRepository;
import ua.goit.repository.RepositoryFactory;
import ua.goit.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {

    private CrudRepository<Long, Customer> repository;

    public CustomerServlet() {
        repository = RepositoryFactory.of(Customer.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String deleteId = req.getParameter("deleteId");
        if (deleteId != null) {
            Optional<Customer> customer = new CustomerService().readById(Customer.class, Long.valueOf(deleteId));
            if (customer.isPresent()) {
                System.out.println("Deleting entity: " + customer.get());
                new CustomerService().deleteById(Customer.class, Long.valueOf(deleteId));
            }
            resp.sendRedirect("/customers");
        } else {
            List<Customer> customers = repository.findAll();
            req.setAttribute("customers", customers);
            req.getRequestDispatcher("/customer/customers.jsp").forward(req, resp);
        }
    }
}
