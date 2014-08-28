/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.udec.ejb;

import com.udec.entidades.Condicion;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class CondicionFacade extends AbstractFacade<Condicion> {
    @PersistenceContext(unitName = "com.udec_encuestas_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CondicionFacade() {
        super(Condicion.class);
    }
    
}
