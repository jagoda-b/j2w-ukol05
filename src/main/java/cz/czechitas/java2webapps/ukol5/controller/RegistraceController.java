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
        final int age = form.getAge();
        if(age < 9 || age > 16) {
            bindingResult.rejectValue("birthDate", null, "Věk účastníka musí být mezi 9 a 15 lety.");
            return "formular";
        }

        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().forEach(error -> logger.error(error.toString()));
            return "formular";
        }

        return new ModelAndView("rekapitulace")
                .addObject("form", form);
    }
}
