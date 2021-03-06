classdef acados_ocp_model < handle
	


	properties
		model_struct
	end %properties



	methods
		

		function obj = acados_ocp_model()
			% model structure
			obj.model_struct = struct;
			% default values
			obj.model_struct.name = 'ocp_model';
			obj.model_struct.cost_type = 'linear_ls';
			obj.model_struct.cost_type_e = 'linear_ls';
			obj.model_struct.cost_param_y = 'false';
			obj.model_struct.cost_param_y_e = 'false';
			obj.model_struct.cost_param_ext_cost = 'false';
			obj.model_struct.cost_param_ext_cost_e = 'false';
			obj.model_struct.dyn_type = 'implicit';
			obj.model_struct.dyn_param_f = 'false';
			obj.model_struct.dyn_param_phi = 'false';
			obj.model_struct.constr_type = 'bgh';
			obj.model_struct.constr_param_h = 'false';
			obj.model_struct.constr_param_h_e = 'false';
		end



		function obj = set(obj, field, value)

			% check for module name
			tokens = strsplit(field, '_');

			% symbolics
			if (strcmp(tokens{1}, 'sym'))

				if (strcmp(field, 'sym_x'))
					obj.model_struct.sym_x = value;
				elseif (strcmp(field, 'sym_xdot'))
					obj.model_struct.sym_xdot = value;
				elseif (strcmp(field, 'sym_u'))
					obj.model_struct.sym_u = value;
				elseif (strcmp(field, 'sym_z'))
					obj.model_struct.sym_z = value;
				elseif (strcmp(field, 'sym_p'))
					obj.model_struct.sym_p = value;
				else
					disp(['acados_ocp_model: set: wrong field: ', field]);
					keyboard;
				end

			% cost
			elseif (strcmp(tokens{1}, 'cost'))

				if (strcmp(field, 'cost_type'))
					obj.model_struct.cost_type = value;
				elseif (strcmp(field, 'cost_type_e'))
					obj.model_struct.cost_type_e = value;
				elseif (strcmp(field, 'cost_expr_y'))
					obj.model_struct.cost_expr_y = value;
				elseif (strcmp(field, 'cost_param_y'))
					obj.model_struct.cost_param_y = value;
				elseif (strcmp(field, 'cost_expr_y_e'))
					obj.model_struct.cost_expr_y_e = value;
				elseif (strcmp(field, 'cost_param_y_e'))
					obj.model_struct.cost_param_y_e = value;
				elseif (strcmp(field, 'cost_expr_ext_cost'))
					obj.model_struct.cost_expr_ext_cost = value;
				elseif (strcmp(field, 'cost_param_ext_cost'))
					obj.model_struct.cost_param_ext_cost = value;
				elseif (strcmp(field, 'cost_expr_ext_cost_e'))
					obj.model_struct.cost_expr_ext_cost_e = value;
				elseif (strcmp(field, 'cost_param_ext_cost_e'))
					obj.model_struct.cost_param_ext_cost_e = value;
				elseif (strcmp(field, 'cost_Vu'))
					obj.model_struct.cost_Vu = value;
				elseif (strcmp(field, 'cost_Vx'))
					obj.model_struct.cost_Vx = value;
				elseif (strcmp(field, 'cost_Vx_e'))
					obj.model_struct.cost_Vx_e = value;
				elseif (strcmp(field, 'cost_W'))
					obj.model_struct.cost_W = value;
				elseif (strcmp(field, 'cost_W_e'))
					obj.model_struct.cost_W_e = value;
				elseif (strcmp(field, 'cost_yr'))
					obj.model_struct.cost_yr = value;
				elseif (strcmp(field, 'cost_yr_e'))
					obj.model_struct.cost_yr_e = value;
				elseif (strcmp(field, 'cost_Z'))
					obj.model_struct.cost_Z = value;
				elseif (strcmp(field, 'cost_Z_e'))
					obj.model_struct.cost_Z_e = value;
				elseif (strcmp(field, 'cost_Zl'))
					obj.model_struct.cost_Zl = value;
				elseif (strcmp(field, 'cost_Zl_e'))
					obj.model_struct.cost_Zl_e = value;
				elseif (strcmp(field, 'cost_Zu'))
					obj.model_struct.cost_Zu = value;
				elseif (strcmp(field, 'cost_Zu_e'))
					obj.model_struct.cost_Zu_e = value;
				elseif (strcmp(field, 'cost_zl'))
					obj.model_struct.cost_zl = value;
				elseif (strcmp(field, 'cost_zl_e'))
					obj.model_struct.cost_zl_e = value;
				elseif (strcmp(field, 'cost_z'))
					obj.model_struct.cost_z = value;
				elseif (strcmp(field, 'cost_z_e'))
					obj.model_struct.cost_z_e = value;
				elseif (strcmp(field, 'cost_zu'))
					obj.model_struct.cost_zu = value;
				elseif (strcmp(field, 'cost_zu_e'))
					obj.model_struct.cost_zu_e = value;
				else
					disp(['acados_ocp_model: set: wrong field: ', field]);
					keyboard;
				end

			% dynamics
			elseif (strcmp(tokens{1}, 'dyn'))

				if (strcmp(field, 'dyn_type'))
					obj.model_struct.dyn_type = value;
				elseif (strcmp(field, 'dyn_expr_f'))
					obj.model_struct.dyn_expr_f = value;
				elseif (strcmp(field, 'dyn_param_f'))
					obj.model_struct.dyn_param_f = value;
				elseif (strcmp(field, 'dyn_expr_phi'))
					obj.model_struct.dyn_expr_phi = value;
				elseif (strcmp(field, 'dyn_param_phi'))
					obj.model_struct.dyn_param_phi = value;
				else
					disp(['acados_ocp_model: set: wrong field: ', field]);
					keyboard;
				end

			% constraints
			elseif (strcmp(tokens{1}, 'constr'))

				if (strcmp(field, 'constr_type'))
					obj.model_struct.constr_type = value;
				elseif (strcmp(field, 'constr_x0'))
					obj.model_struct.constr_x0 = value;
				elseif (strcmp(field, 'constr_Jbx'))
					obj.model_struct.constr_Jbx = value;
				elseif (strcmp(field, 'constr_lbx'))
					obj.model_struct.constr_lbx = value;
				elseif (strcmp(field, 'constr_ubx'))
					obj.model_struct.constr_ubx = value;
				elseif (strcmp(field, 'constr_Jbu'))
					obj.model_struct.constr_Jbu = value;
				elseif (strcmp(field, 'constr_lbu'))
					obj.model_struct.constr_lbu = value;
				elseif (strcmp(field, 'constr_ubu'))
					obj.model_struct.constr_ubu = value;
				elseif (strcmp(field, 'constr_C'))
					obj.model_struct.constr_C = value;
				elseif (strcmp(field, 'constr_D'))
					obj.model_struct.constr_D = value;
				elseif (strcmp(field, 'constr_lg'))
					obj.model_struct.constr_lg = value;
				elseif (strcmp(field, 'constr_ug'))
					obj.model_struct.constr_ug = value;
				elseif (strcmp(field, 'constr_C_e'))
					obj.model_struct.constr_C_e = value;
				elseif (strcmp(field, 'constr_lg_e'))
					obj.model_struct.constr_lg_e = value;
				elseif (strcmp(field, 'constr_ug_e'))
					obj.model_struct.constr_ug_e = value;
				elseif (strcmp(field, 'constr_expr_h'))
					obj.model_struct.constr_expr_h = value;
				elseif (strcmp(field, 'constr_param_h'))
					obj.model_struct.constr_param_h = value;
				elseif (strcmp(field, 'constr_lh'))
					obj.model_struct.constr_lh = value;
				elseif (strcmp(field, 'constr_uh'))
					obj.model_struct.constr_uh = value;
				elseif (strcmp(field, 'constr_expr_h_e'))
					obj.model_struct.constr_expr_h_e = value;
				elseif (strcmp(field, 'constr_param_h_e'))
					obj.model_struct.constr_param_h_e = value;
				elseif (strcmp(field, 'constr_lh_e'))
					obj.model_struct.constr_lh_e = value;
				elseif (strcmp(field, 'constr_uh_e'))
					obj.model_struct.constr_uh_e = value;
				elseif (strcmp(field, 'constr_Jsbu'))
					obj.model_struct.constr_Jsbu = value;
	%			elseif (strcmp(field, 'constr_lsbu'))
	%				obj.model_struct.constr_lsbu = value;
	%			elseif (strcmp(field, 'constr_usbu'))
	%				obj.model_struct.constr_usbu = value;
				elseif (strcmp(field, 'constr_Jsbx'))
					obj.model_struct.constr_Jsbx = value;
	%			elseif (strcmp(field, 'constr_lsbx'))
	%				obj.model_struct.constr_lsbx = value;
	%			elseif (strcmp(field, 'constr_usbx'))
	%				obj.model_struct.constr_usbx = value;
				elseif (strcmp(field, 'constr_Jsg'))
					obj.model_struct.constr_Jsg = value;
	%			elseif (strcmp(field, 'constr_lsg'))
	%				obj.model_struct.constr_lsg = value;
	%			elseif (strcmp(field, 'constr_usg'))
	%				obj.model_struct.constr_usg = value;
				elseif (strcmp(field, 'constr_Jsg_e'))
					obj.model_struct.constr_Jsg_e = value;
	%			elseif (strcmp(field, 'constr_lsg_e'))
	%				obj.model_struct.constr_lsg_e = value;
	%			elseif (strcmp(field, 'constr_usg_e'))
	%				obj.model_struct.constr_usg_e = value;
				elseif (strcmp(field, 'constr_Jsh'))
					obj.model_struct.constr_Jsh = value;
	%			elseif (strcmp(field, 'constr_lsh'))
	%				obj.model_struct.constr_lsh = value;
	%			elseif (strcmp(field, 'constr_ush'))
	%				obj.model_struct.constr_ush = value;
				elseif (strcmp(field, 'constr_Jsh_e'))
					obj.model_struct.constr_Jsh_e = value;
	%			elseif (strcmp(field, 'constr_lsh_e'))
	%				obj.model_struct.constr_lsh_e = value;
	%			elseif (strcmp(field, 'constr_ush_e'))
	%				obj.model_struct.constr_ush_e = value;
				else
					disp(['acados_ocp_model: set: wrong field: ', field]);
					keyboard;
				end

			% dims
			elseif (strcmp(tokens{1}, 'dim'))

				if (strcmp(field, 'dim_nx'))
					obj.model_struct.dim_nx = value;
				elseif (strcmp(field, 'dim_nu'))
					obj.model_struct.dim_nu = value;
				elseif (strcmp(field, 'dim_nz'))
					obj.model_struct.dim_nz = value;
				elseif (strcmp(field, 'dim_ny'))
					obj.model_struct.dim_ny = value;
				elseif (strcmp(field, 'dim_ny_e'))
					obj.model_struct.dim_ny_e = value;
				elseif (strcmp(field, 'dim_nbx'))
					obj.model_struct.dim_nbx = value;
				elseif (strcmp(field, 'dim_nbu'))
					obj.model_struct.dim_nbu = value;
				elseif (strcmp(field, 'dim_ng'))
					obj.model_struct.dim_ng = value;
				elseif (strcmp(field, 'dim_ng_e'))
					obj.model_struct.dim_ng_e = value;
				elseif (strcmp(field, 'dim_nh'))
					obj.model_struct.dim_nh = value;
				elseif (strcmp(field, 'dim_nh_e'))
					obj.model_struct.dim_nh_e = value;
				elseif (strcmp(field, 'dim_ns'))
					obj.model_struct.dim_ns = value;
				elseif (strcmp(field, 'dim_ns_e'))
					obj.model_struct.dim_ns_e = value;
				elseif (strcmp(field, 'dim_nsbu'))
					obj.model_struct.dim_nsbu = value;
				elseif (strcmp(field, 'dim_nsbx'))
					obj.model_struct.dim_nsbx = value;
				elseif (strcmp(field, 'dim_nsg'))
					obj.model_struct.dim_nsg = value;
				elseif (strcmp(field, 'dim_nsg_e'))
					obj.model_struct.dim_nsg_e = value;
				elseif (strcmp(field, 'dim_nsh'))
					obj.model_struct.dim_nsh = value;
				elseif (strcmp(field, 'dim_nsh_e'))
					obj.model_struct.dim_nsh_e = value;
				elseif (strcmp(field, 'dim_np'))
					obj.model_struct.dim_np = value;
				else
					disp(['acados_ocp_model: set: wrong field: ', field]);
					keyboard;
				end

			% others
			else

				if (strcmp(field, 'T'))
					obj.model_struct.T = value;

				else
					disp(['acados_ocp_model: set: wrong field: ', field]);
					keyboard;
				end
			end
		end

	end % methods



end % class


