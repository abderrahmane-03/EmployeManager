package com.servlet;

import com.DAO.imp.EmployeeDAO;
import com.DAO.inf.EmployeeDaoInterface;
import com.entity.Employee;
import javax.servlet.http.Part;
import java.nio.file.Paths;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class EmployeeServlet extends HttpServlet {
    private EmployeeDaoInterface employeeDao;
    private static final String UPLOAD_DIR = "static";

    @Override
    public void init() {
        employeeDao = new EmployeeDAO();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getServletPath());
            switch (request.getServletPath()) {
                case "/search":
                    search(request,response);
                case "/filter":
                    filter(request,response);
                    break;
                case "/update":
                    edit(request, response);
                    break;
                case "/delete":
                    delete(request, response);
                    break;
                case "/home":
                    list(request, response);
                    break;
            }
         }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        switch (request.getServletPath()) {

            case "/create":
                create(request, response);
                break;
            case "/edit":
                update(request, response);
                break;

        }
    }


    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeDao.deleteEmployee(id);
        response.sendRedirect("/EmployManger/");
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String position = request.getParameter("position");

        // Handling file upload
        Part filePart = request.getPart("picture"); // Retrieves the file input
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

        // Ensure the upload directory exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

                // Save the uploaded file to disk
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Creating the employee object
        Employee employee = new Employee();
        employee.setName(name);
        employee.setEmail(email);
        employee.setPhone(phone);
        employee.setDepartment(department);
        employee.setPosition(position);
        employee.setPicture(fileName);  // Storing the file name in the DB

        // Save the employee
        employeeDao.saveEmployee(employee);
        response.sendRedirect("/EmployManger/");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = employeeDao.getEmployeeById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/updateForm.jsp");
        request.setAttribute("employee", existingEmployee);
        dispatcher.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employees = employeeDao.getAllEmployees();

        request.setAttribute("employeeList", employees);
        System.out.println("is"+employees.size());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/index.jsp");
        dispatcher.forward(request, response);}

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String  email = request.getParameter("email");
        String  phone = request.getParameter("phone");
        String position = request.getParameter("position");
        String department = request.getParameter("department");
        String picture = request.getParameter("picture");
        Employee employee = new Employee();
        employee.setId(id);
        employee.setName(name);
        employee.setEmail(email);
        employee.setPhone(phone);
        employee.setDepartment(department);
        employee.setPosition(position);
        employee.setPicture(picture);

        employeeDao.updateEmployee(employee);
        response.sendRedirect("/EmployManger/");
    }

    public void filter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterOption = request.getParameter("filter");  // get filter option from the form
        List<Employee> filteredEmployees = employeeDao.filter(filterOption);
        request.setAttribute("employeeList", filteredEmployees);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/index.jsp");
        dispatcher.forward(request, response);  // forward to JSP to display results
    }

    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("search");  // get search input from the form
        List<Employee> searchResults = employeeDao.search(searchTerm);
        request.setAttribute("employeeList", searchResults);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/index.jsp");
        dispatcher.forward(request, response);  // forward to JSP to display results
    }


}

