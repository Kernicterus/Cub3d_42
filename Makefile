# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aranger <aranger@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/31 17:54:43 by nledent           #+#    #+#              #
#    Updated: 2024/04/30 12:45:02 by aranger          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#-PATH FILES-#

SRC_DIR			= src
SRC_BONUS_DIR	= src_bonus
OBJ_DIR			= obj
OBJ_BONUS_DIR	= obj_bonus

#-LIBFT-#

LIBFT			= lib/libft
LIBFT_A			= lib/libft/libft.a

#-LIBMLX-#

LIBMLX			= lib/MLX42
LIBMLX_A		= $(LIBMLX)/build/libmlx42.a 
HEADERS			= -I ./include -I $(LIBMLX)/include

#-SRC-#

SRC				= $(addprefix src/, $(SRCS))
OBJS			= $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
D_OBJS			= mkdir -p $(@D)

SRCS		=	\
					main.c \
					display.c \
					map_parsing/parsing.c \
					map_parsing/extract_textures_path.c \
					map_parsing/extract_colors_data.c \
					map_parsing/extract_file.c \
					map_parsing/extract_map.c \
					map_parsing/rgb_to_int.c \
					map_parsing/map_to_tab.c \
					map_parsing/check_walls.c \
					utils/check_args.c \
					utils/print_errors.c \
					utils/free_functions.c \
					utils/colors.c \
					utils/utils.c \
					utils/utils_lst.c \
					utils/load_images.c \
					raycasting/init_player.c \
					raycasting/draw_ver_line.c \
					raycasting/raycasting.c \
					raycasting/raycasting2.c \
					command/keyboard.c \
					command/command.c \
					command/move_player.c \
					command/display_image.c \

#-BONUS-#

SRCS_BONUS		=	\
					main_bonus.c \
					display_bonus.c \
					map_parsing/parsing_bonus.c \
					map_parsing/extract_textures_path_bonus.c \
					map_parsing/extract_colors_data_bonus.c \
					map_parsing/extract_file_bonus.c \
					map_parsing/extract_map_bonus.c \
					map_parsing/rgb_to_int_bonus.c \
					map_parsing/map_to_tab_bonus.c \
					map_parsing/check_walls_bonus.c \
					utils/check_args_bonus.c \
					utils/print_errors_bonus.c \
					utils/free_functions_bonus.c \
					utils/free_functions2_bonus.c \
					utils/colors_bonus.c \
					utils/utils_bonus.c \
					utils/utils_lst_bonus.c \
					utils/load_images_bonus.c \
					sprites_and_anims/display_info_bonus.c \
					sprites_and_anims/anim_init_bonus.c \
					sprites_and_anims/anim_hands_bonus.c \
					sprites_and_anims/display_sprites_bonus.c \
					sprites_and_anims/coord_sprite_bonus.c \
					sprites_and_anims/load_sprites_bonus.c \
					sprites_and_anims/collision_sprites.c \
					print_map/draw_minimap_bonus.c \
					raycasting/init_player_bonus.c \
					raycasting/draw_ver_line_bonus.c \
					raycasting/raycasting_bonus.c \
					raycasting/raycasting2_bonus.c \
					command/keyboard_bonus.c \
					command/mouse_bonus.c \
					command/command_bonus.c \
					command/move_player_bonus.c \
					command/display_image.c \
					command/open_door.c \

SRC_BONUS		= $(addprefix src_bonus/, $(SRCS_BONUS))
OBJS_BONUS		= $(SRC_BONUS:$(SRC_BONUS_DIR)/%.c=$(OBJ_BONUS_DIR)/%.o)
D_OBJS_BONUS	= mkdir -p $(@D)

#-UTILS-#

CC 				= cc
CFLAGS 			= -Wall -Wextra -Werror -Wunreachable-code -g
NAME 			= cub3D
RM 				= rm -f
RMR				= rm -rf

#-RULES-#

all:			$(NAME)

$(LIBMLX_A):
				@cmake $(LIBMLX) -B $(LIBMLX)/build && make -C $(LIBMLX)/build -j4

$(LIBFT_A) :
				@make -C $(LIBFT)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
				$(D_OBJS)
				$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ_BONUS_DIR)/%.o: $(SRC_BONUS_DIR)/%.c
				$(D_OBJS_BONUS)
				$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): 		$(OBJS) $(LIBFT_A) $(LIBMLX_A)
				@$(CC) $(CFLAGS) $(OBJS) $(LIBFT_A) $(LIBMLX_A) -ldl -lglfw -pthread -lm $(HEADERS) -o $(NAME)
				
clean:
				@$(RMR) $(OBJ_DIR)
				@$(RMR) $(OBJ_BONUS_DIR)
				@$(RMR) $(LIBMLX)/build
				@make -C $(LIBFT) clean

fclean: 		clean
				@$(RM) $(NAME)
				@$(RM) $(NAME_BONUS)
				@make -C $(LIBFT) fclean

re:				fclean all

bonus :			$(LIBFT_A) $(LIBMLX_A) $(OBJS_BONUS)
				@$(RM) $(NAME)
				@$(CC) $(CFLAGS) $(OBJS_BONUS) $(LIBFT_A)  $(LIBMLX_A) -ldl -lglfw -pthread -lm $(HEADERS) -o $(NAME)

.PHONY : 		all clean fclean re bonus