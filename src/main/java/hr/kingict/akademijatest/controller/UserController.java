package hr.kingict.akademijatest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/api/user")
@CrossOrigin
public class UserController {

    /**
     * Dohvaćam podatke o ulogiranom korisniku.
     * Metodi može pristupiti samo rola USER
     *
     * @param principal
     * @return podatke o ulogiranom korisniku
     */
    @GetMapping("/info")
    @Secured("USER")
    public ResponseEntity<?> getUserInfo(Principal principal){
        return new ResponseEntity<>(principal, HttpStatus.OK);
    }
}
