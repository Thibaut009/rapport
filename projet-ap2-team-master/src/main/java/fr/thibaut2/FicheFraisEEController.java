package fr.thibaut2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;

public class FicheFraisEEController {
    
    @FXML
    private TextField MU_nuitee;
    @FXML
    private TextField QTE_nuitee;
    @FXML
    private TextField TOTAL_nuitee;

    @FXML
    private TextField MU_repas;
    @FXML
    private TextField QTE_repas;
    @FXML
    private TextField TOTAL_repas;

    @FXML
    private TextField MU_km;
    @FXML
    private TextField QTE_km;
    @FXML
    private TextField TOTAL_km;

    @FXML
    private Button Validation;

    @FXML
    void calcul(KeyEvent event) {

        //calcule nuitée

        //recuperation et transformation variable 1
        String quantiter_nuitee = QTE_nuitee.getText();
        int nbr_QTE_nuitee = Integer.parseInt(quantiter_nuitee);
        
        //recuperation et transformation variable 2
        String montant_unitaire_nuitee = MU_nuitee.getText();
        double nbr_MU_nuitee = Double.parseDouble(montant_unitaire_nuitee);

        //calcul et transformation resultat
        double TOTAL1 = nbr_QTE_nuitee * nbr_MU_nuitee;
        String TOTALnuitee = String.valueOf(TOTAL1);

        //affichage resultat
        TOTAL_nuitee.setText(TOTALnuitee);

        //---------------------------------------------------------------------------------------------//

        //calcule repas

        //recuperation et transformation variable 1
        String quantiter_repas = QTE_repas.getText();
        int nbr_QTE_repas = Integer.parseInt(quantiter_repas);
        
        //recuperation et transformation variable 2
        String montant_unitaire_repas = MU_repas.getText();
        double nbr_MU_repas = Double.parseDouble(montant_unitaire_repas);

        //calcul et transformation resultat
        double TOTAL2 = nbr_QTE_repas * nbr_MU_repas;
        String TOTALrepas = String.valueOf(TOTAL2);

        //affichage resultat
        TOTAL_repas.setText(TOTALrepas);

        //---------------------------------------------------------------------------------------------//

      //calcule km

        //recuperation et transformation variable 1
        String quantiter_km = QTE_km.getText();
        int nbr_QTE_km = Integer.parseInt(quantiter_km);
        
        //recuperation et transformation variable 2
        String montant_unitaire_km = MU_km.getText();
        double nbr_MU_km = Double.parseDouble(montant_unitaire_km);

        //calcul et transformation resultat
        double TOTAL3 = nbr_QTE_km * nbr_MU_km;
        String TOTALkm = String.valueOf(TOTAL3);

        //affichage resultat
        TOTAL_km.setText(TOTALkm);

        //---------------------------------------------------------------------------------------------//
    }

    @FXML
    void ValidationEvent() throws IOException {

      if (!QTE_repas.getText().equals("") && !QTE_nuitee.getText().equals("") && !QTE_km.getText().equals("")) {

        String dbURL = "jdbc:mysql://localhost:3306/application";
        String username = "root";
        String password = "";
    
        try {

          Connection conn = DriverManager.getConnection(dbURL, username, password);

          if (conn != null) {
            System.out.println("Connected");

            // étape 3: créer l'objet statement
            Statement stmt = conn.createStatement();
            String sql = "INSERT INTO fiche_de_frais (repas_midi, kilometrage, nuitee) VALUES ('"+QTE_repas.getText()+"', '"+QTE_km.getText()+"', '"+QTE_nuitee.getText()+"');";
            stmt.executeUpdate(sql);
          }

        } catch (SQLException ex) {
          ex.printStackTrace();
        }

      }
    }
}
