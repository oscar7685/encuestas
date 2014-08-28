/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.ejb;

import com.udec.entidades.Encuesta;
import com.udec.entidades.Pregunta;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ususario
 */
@Stateless
public class EncuestaFacade extends AbstractFacade<Encuesta> {

    @PersistenceContext(unitName = "com.udec_encuestas_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EncuestaFacade() {
        super(Encuesta.class);
    }

    public List<Pregunta> preguntasOrdenadasXorden(Encuesta e) {
        Query q = em.createQuery("SELECT p FROM Pregunta p WHERE p.encuestaIdencuesta = :encuesta ORDER BY p.orden ASC");
        q.setParameter("encuesta", e);
        return q.getResultList();
    }
}
