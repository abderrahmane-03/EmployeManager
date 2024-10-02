package com.servlet;

import com.DAO.imp.EmployeeDAO;
import com.DAO.inf.EmployeeDaoInterface;
import com.entity.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EmployeeServlet extends HttpServlet {
    private EmployeeDaoInterface employeeDao;
    @Override
    public void init() {
        employeeDao = new EmployeeDAO();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


            switch (request.getServletPath()) {
                case "/update":
                    edit(request, response);
                    break;
                case "/delete":
                    delete(request, response);
                    break;
                case "/":
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

        Employee employee = new Employee();
        employee.setName(name);
        employee.setEmail(email);
        employee.setDepartment(phone);
        employee.setDepartment(department);
        employee.setPosition(position);

            employeeDao.saveEmployee(employee);  // Save a new employee
        response.sendRedirect("/EmployManger/");  // Redirect to the list page after saving
    }
    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = employeeDao.getEmployeeById(id);  // Fetch the employee data
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/updateForm.jsp");
        request.setAttribute("employee", existingEmployee);  // Pass the employee data to the JSP
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
        Employee employee = new Employee();
        employee.setId(id);
        employee.setName(name);
        employee.setEmail(email);
        employee.setPhone(phone);
        employee.setDepartment(department);
        employee.setPosition(position);

        employeeDao.updateEmployee(employee);  // Update the employee data
        response.sendRedirect("/EmployManger/");  // Redirect to the list page after updating
    }

}

