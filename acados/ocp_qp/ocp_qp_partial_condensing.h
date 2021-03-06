/*
 * Copyright 2019 Gianluca Frison, Dimitris Kouzoupis, Robin Verschueren, Andrea Zanelli, Niels van Duijkeren, Jonathan Frey, Tommaso Sartor, Branimir Novoselnik, Rien Quirynen, Rezart Qelibari, Dang Doan, Jonas Koenemann, Yutao Chen, Tobias Schöls, Jonas Schlagenhauf, Moritz Diehl
 *
 * This file is part of acados.
 *
 * The 2-Clause BSD License
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef ACADOS_OCP_QP_OCP_QP_PARTIAL_CONDENSING_H_
#define ACADOS_OCP_QP_OCP_QP_PARTIAL_CONDENSING_H_

#ifdef __cplusplus
extern "C" {
#endif

// acados
#include "acados/ocp_qp/ocp_qp_common.h"



typedef struct ocp_qp_partial_condensing_opts_
{
    struct d_cond_qp_ocp2ocp_arg *hpipm_opts;
    ocp_qp_dims *pcond_dims;  // TODO(all): move to dims
    int *block_size;
    int N2;
    int N2_bkp;
	int ric_alg;
} ocp_qp_partial_condensing_opts;



typedef struct ocp_qp_partial_condensing_memory_
{
    struct d_cond_qp_ocp2ocp_workspace *hpipm_workspace;
    ocp_qp_in *qp_in;
    ocp_qp_in *pcond_qp_in;
} ocp_qp_partial_condensing_memory;



//
int ocp_qp_partial_condensing_opts_calculate_size(ocp_qp_dims *dims);
//
void *ocp_qp_partial_condensing_opts_assign(ocp_qp_dims *dims, void *raw_memory);
//
void ocp_qp_partial_condensing_opts_initialize_default(ocp_qp_dims *dims, void *opts_);
//
void ocp_qp_partial_condensing_opts_update(ocp_qp_dims *dims, void *opts_);
//
void ocp_qp_partial_condensing_opts_set(void *opts_, const char *field, void* value);
//
int ocp_qp_partial_condensing_memory_calculate_size(ocp_qp_dims *dims, void *opts_);
//
void *ocp_qp_partial_condensing_memory_assign(ocp_qp_dims *dims, void *opts, void *raw_memory);
//
int ocp_qp_partial_condensing_workspace_calculate_size(ocp_qp_dims *dims, void *opts_);
//
void ocp_qp_partial_condensing(ocp_qp_in *in, ocp_qp_in *out, ocp_qp_partial_condensing_opts *opts,
                               ocp_qp_partial_condensing_memory *mem, void *work);
//
void ocp_qp_partial_expansion(ocp_qp_out *in, ocp_qp_out *out, ocp_qp_partial_condensing_opts *opts,
                              ocp_qp_partial_condensing_memory *mem, void *work);
//
void ocp_qp_partial_condensing_config_initialize_default(void *config_);



#ifdef __cplusplus
} /* extern "C" */
#endif

#endif  // ACADOS_OCP_QP_OCP_QP_PARTIAL_CONDENSING_H_
