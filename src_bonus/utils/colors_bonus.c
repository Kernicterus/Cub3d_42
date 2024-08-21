/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   colors_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nledent <nledent@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/31 17:56:50 by nledent           #+#    #+#             */
/*   Updated: 2024/04/29 19:13:07 by nledent          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/cub3D_bonus.h"

int	rgb_to_int(unsigned char red, unsigned char green, unsigned char blue)
{
	int	color;

	color = 0;
	color += (int)red;
	color = color << 8;
	color += (int)green;
	color = color << 8;
	color += (int)blue;
	return (color);
}

uint32_t	convert_color(unsigned int color)
{
	return ((color << 8) | 0xff);
}

void	put_pixel(mlx_image_t *img, uint32_t x,
						uint32_t y, int color)
{
	if ((x > 0 && x < img->width) && (y > 0 && y < img->height))
		mlx_put_pixel(img, x, y, color);
}

int	get_color_px_txt(uint32_t x, uint32_t y, mlx_texture_t *txt)
{
	int	px_id;
	int	color;

	px_id = 0;
	color = 0;
	px_id = y * txt->width * txt->bytes_per_pixel + x * txt->bytes_per_pixel;
	color = rgb_to_int(txt->pixels[px_id], txt->pixels[px_id + 1],
			txt->pixels[px_id + 2]);
	color = convert_color(color);
	return (color);
}

int	get_color_px_img(uint32_t x, uint32_t y, mlx_image_t *img)
{
	int	px_id;
	int	color;
	int	bytes_per_px;

	bytes_per_px = 4;
	px_id = 0;
	color = 0;
	px_id = y * img->width * bytes_per_px + x * bytes_per_px;
	color = rgb_to_int(img->pixels[px_id], img->pixels[px_id + 1],
			img->pixels[px_id + 2]);
	color = convert_color(color);
	return (color);
}
