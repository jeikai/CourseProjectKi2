/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.aptech.librarymanagement;

import View.Login;

/**
 *
 * @author Nguyen Dai Phat
 */
public class LibraryManagement {

    public static void main(String[] args) {
        Login login = new Login();
        login.setVisible(true);
        // Đặt cửa sổ ở giữa màn hình theo mặc định
        login.setLocationRelativeTo(null);
    }
}
