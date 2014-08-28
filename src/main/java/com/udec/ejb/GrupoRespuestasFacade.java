/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.udec.ejb;

import com.udec.entidades.GrupoRespuestas;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class GrupoRespuestasFacade extends AbstractFacade<GrupoRespuestas> {
    @PersistenceContext(unitName = "com.udec_encuestas_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GrupoRespuestasFacade() {
        super(GrupoRespuestas.class);
    }
    
}
