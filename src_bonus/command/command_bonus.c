/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   command_bonus.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aranger <aranger@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/13 18:06:04 by aranger           #+#    #+#             */
/*   Updated: 2024/04/24 13:53:39 by aranger          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/cub3D_bonus.h"

void	resize_mlx(int32_t width, int32_t height, void *param)
{
	t_window_settings	*set;

	set = param;
	set->window->width = width;
	set->window->height = height;
	mlx_delete_image(set->window, set->img);
}

void	close_fct(void *param)
{
	t_window_settings	*set;

	set = param;
	mlx_close_window(set->window);
}

void	init_command(t_params *game)
{
	mlx_key_hook(game->win->window, &my_keyhook, game);
	mlx_set_cursor_mode(game->win->window, MLX_MOUSE_HIDDEN);
	mlx_cursor_hook(game->win->window, &cursor_fct, game);
	mlx_loop_hook(game->win->window, &display_game, game);
	mlx_loop_hook(game->win->window, &move_player, game);
}
