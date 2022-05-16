package fr.thibaut2;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;

public class PrivilegeController {

    @FXML
    ImageView vueImage;

    @FXML
    private Button Cbutton;

    @FXML
    private Button Vbutton;

    @FXML
    void SwitchToComptable(ActionEvent event) throws IOException {
        App.setRoot("loginC");
    }

    @FXML
    void SwitchToVisiteur(ActionEvent event) throws IOException {
        App.setRoot("loginV");
    }

}
