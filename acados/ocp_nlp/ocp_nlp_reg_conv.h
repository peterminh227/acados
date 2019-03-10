/*
 *    This file is part of acados.
 *
 *    acados is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation; either
 *    version 3 of the License, or (at your option) any later version.
 *
 *    acados is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public
 *    License along with acados; if not, write to the Free Software Foundation,
 *    Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#ifndef ACADOS_OCP_NLP_OCP_NLP_REG_CONV_H_
#define ACADOS_OCP_NLP_OCP_NLP_REG_CONV_H_

#ifdef __cplusplus
extern "C" {
#endif



// blasfeo
#include "blasfeo/include/blasfeo_common.h"

// acados
#include "acados/ocp_nlp/ocp_nlp_reg_common.h"



/************************************************
 * dims
 ************************************************/

 // TODO ???

/************************************************
 * options
 ************************************************/

typedef struct
{
    double delta;
	double epsilon;
//	double gamma; // 0.0
} ocp_nlp_reg_conv_opts;

//
int ocp_nlp_reg_conv_opts_calculate_size(void);
//
void *ocp_nlp_reg_conv_opts_assign(void *raw_memory);
//
void ocp_nlp_reg_conv_opts_initialize_default(void *config_, ocp_nlp_reg_dims *dims, void *opts_);
//
void ocp_nlp_reg_conv_opts_set(void *config_, ocp_nlp_reg_dims *dims, void *opts_, char *field, void* value);



/************************************************
 * memory
 ************************************************/

typedef struct {
    double *R;
    double *V; // TODO move to workspace
    double *d; // TODO move to workspace
    double *e; // TODO move to workspace
    double *reg_hess; // TODO move to workspace

    struct blasfeo_dmat Q_tilde;
    struct blasfeo_dmat Q_bar;
    struct blasfeo_dmat BAQ;
    struct blasfeo_dmat L;
    struct blasfeo_dmat delta_eye;
    struct blasfeo_dmat St_copy;

    struct blasfeo_dmat *original_RSQrq;

//    struct blasfeo_dvec grad;
//    struct blasfeo_dvec b2;

	// giaf's
    struct blasfeo_dmat **RSQrq;  // pointer to RSQrq in qp_in
    struct blasfeo_dvec **rq;  // pointer to rq in qp_in
    struct blasfeo_dmat **BAbt;  // pointer to BAbt in qp_in
    struct blasfeo_dvec **b;  // pointer to b in qp_in

} ocp_nlp_reg_conv_memory;

//
int ocp_nlp_reg_conv_calculate_memory_size(void *config, ocp_nlp_reg_dims *dims, void *opts);
//
void *ocp_nlp_reg_conv_assign_memory(void *config, ocp_nlp_reg_dims *dims, void *opts, void *raw_memory);

/************************************************
 * workspace
 ************************************************/

 // TODO

/************************************************
 * functions
 ************************************************/

//
void ocp_nlp_reg_conv_config_initialize_default(ocp_nlp_reg_config *config);

#ifdef __cplusplus
}
#endif

#endif  // ACADOS_OCP_NLP_OCP_NLP_REG_CONV_H_
