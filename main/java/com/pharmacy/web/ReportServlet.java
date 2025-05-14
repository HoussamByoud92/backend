package main.java.com.pharmacy.web;

import main.java.com.pharmacy.service.MedicationService;
import main.java.com.pharmacy.service.SaleService;
import main.java.com.pharmacy.service.SupplierService;
import main.java.com.pharmacy.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reports")
public class ReportServlet extends main.java.com.pharmacy.web.BaseServlet {
    private final SaleService saleService = new SaleService();
    private final MedicationService medicationService = new MedicationService();
    private final SupplierService supplierService = new SupplierService();
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requireAuthentication(request, response);

        // Fetch summary data
        long totalSales = saleService.findAll().size();
        long totalMedications = medicationService.findAll().size();
        long totalSuppliers = supplierService.findAll().size();
        long totalUsers = userService.findAll().size();

        request.setAttribute("totalSales", totalSales);
        request.setAttribute("totalMedications", totalMedications);
        request.setAttribute("totalSuppliers", totalSuppliers);
        request.setAttribute("totalUsers", totalUsers);

        forwardToJsp(request, response, "reports/report.jsp");
    }
}
