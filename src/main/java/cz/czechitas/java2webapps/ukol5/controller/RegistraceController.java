package cz.czechitas.java2webapps.ukol5.controller;

import cz.czechitas.java2webapps.ukol5.entity.RegistraceForm;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.Period;

/**
 * Kontroler obsluhující registraci účastníků dětského tábora.
 */
@Controller
public class RegistraceController {

    private static final Logger logger = LoggerFactory.getLogger(RegistraceController.class);

    @GetMapping("/")
    public ModelAndView formular() {
        ModelAndView modelAndView = new ModelAndView("formular");
        modelAndView.addObject("form", new RegistraceForm());
        return modelAndView;
    }

    @PostMapping("/")
    public Object register(@Valid @ModelAttribute("form") RegistraceForm form, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error -> logger.error(error.toString()));
            return "formular";
        }

        if (!overeniVeku(form.getBirthDate())) {
            bindingResult.rejectValue("birthDate", null, "Věk účastníka musí být mezi 9 a 15 lety.");
            return "formular";
        }

        return new ModelAndView("rekapitulace")
                .addObject("firstName", form.getFirstName())
                .addObject("lastName", form.getLastName())
                .addObject("birthDate", form.getBirthDate())
                .addObject("gender", form.getGender())
                .addObject("session", form.getSession())
                .addObject("parentEmail", form.getParentEmail())
                .addObject("parentPhone", form.getParentPhone());

    }

    private boolean overeniVeku(LocalDate birthDate) {
        Period period = birthDate.until(LocalDate.now());
        int vek = period.getYears();
        return vek >= 9 && vek <= 15;
    }
}
