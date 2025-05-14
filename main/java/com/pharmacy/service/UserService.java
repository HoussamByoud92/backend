package main.java.com.pharmacy.service;

import main.java.com.pharmacy.dao.UserDAO;
import main.java.com.pharmacy.model.User;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class UserService implements BaseService<User> {
    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    public main.java.com.pharmacy.model.User findById(Long id) {
        return userDAO.findById(id);
    }

    public List<main.java.com.pharmacy.model.User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public User save(User user) {
        return userDAO.save(user);
    }

    @Override
    public User update(User user) {
        return userDAO.update(user);
    }

    @Override
    public void delete(Long id) {
        userDAO.delete(id);
    }

    public User findByUsername(String username) {
        return userDAO.findByUsername(username);
    }

    public User authenticate(String username, String password) {
        User user = findByUsername(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            userDAO.updateLastLogin(user.getId());
            return user;
        }
        return null;
    }

    public boolean isUsernameTaken(String username) {
        return findByUsername(username) != null;
    }

    public boolean isEmailRegistered(String email) {
        return findAll().stream()
                .anyMatch(user -> email.equals(user.getEmail()));
    }

    public void updateLastLogin(Long userId) {
        userDAO.updateLastLogin(userId);
    }

    public List<main.java.com.pharmacy.model.User> search(String query) {
        return userDAO.search(query);
    }
}
