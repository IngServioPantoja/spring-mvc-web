package co.com.sp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.com.sp.capadominio.ParametroPersona;
import co.com.sp.capadominio.Persona;
import co.com.sp.capaservicio.ParametroPersonaService;
import co.com.sp.capaservicio.PersonaService;
import co.com.sp.capaservicio.excepciones.BusinessException;

@Controller
public class PersonaController {
    
	@Autowired
	private PersonaService personaService;
	
	@Autowired
	private ParametroPersonaService parametroPersonaService;
	
	final Long ID_TIPO_PARAMETRO_PERSONA = (long) 1;
	
    //form.htm?verForm
    @RequestMapping(params = "listar")
    public ModelAndView listar(){
        ModelAndView mav = new ModelAndView("/personas/listar"); //view.jsp
        List<ParametroPersona> generos = new ArrayList<ParametroPersona>();
        List<Persona> lstPersonas = new ArrayList<Persona>();
        try {
    		generos = parametroPersonaService.findByTipo(ID_TIPO_PARAMETRO_PERSONA);
			lstPersonas = personaService.listar();
		} catch (BusinessException e) {
			System.out.println("Error en la capa web consultando Personas "+e);
		}
        Persona persona = new Persona();
        mav.addObject("personas",lstPersonas);
        mav.addObject("personaDetalle",persona);
        mav.addObject("generos",generos);
        return mav;
    }
    
    //personas?agregarPersona
    @RequestMapping(params = "agregarPersona")
    public ModelAndView agregarPersona(@ModelAttribute Persona p){
        ModelAndView mav = new ModelAndView("/personas/components/listado");
        List<Persona> lstPersonas = new ArrayList<Persona>();
        try {
			personaService.insertar(p);
			lstPersonas = personaService.listar();
		} catch (BusinessException e) {
			System.out.println("Error en la capa web consultando Personas "+e);
		}
        mav.addObject("personas",lstPersonas);
        return mav;
    }
    
    
    //personas?agregarPersona
    @RequestMapping(params = "detallarPersona")
    public ModelAndView detallarPersona(@ModelAttribute Persona p){
        ModelAndView mav = new ModelAndView("/personas/components/persona");
    	List<ParametroPersona> generos = new ArrayList<ParametroPersona>();
        try { 
    		generos = parametroPersonaService.findByTipo(ID_TIPO_PARAMETRO_PERSONA);
			p = personaService.encontrarPorIdCompleta(p.getIdPersona());
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        mav.addObject("personaDetalle",p);
        mav.addObject("generos",generos);
        return mav;
    }
}
