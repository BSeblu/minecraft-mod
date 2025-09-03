package com.yourname.customblock;

import net.minecraft.core.BlockPos;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.InteractionHand;
import net.minecraft.world.ItemInteractionResult;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.level.Level;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.phys.BlockHitResult;

public class CustomBlock extends Block {
    public CustomBlock(Properties properties) {
        super(properties);
    }

    @Override
    protected ItemInteractionResult useItemOn(ItemStack stack, BlockState state, Level level, BlockPos pos, Player player, InteractionHand hand, BlockHitResult hitResult) {
        if (!level.isClientSide()) {
            level.playSound(null, pos, SoundEvents.BELL_BLOCK, SoundSource.BLOCKS, 1.0F, 1.0F);
            player.displayClientMessage(net.minecraft.network.chat.Component.literal("You clicked the custom block!"), true);
        }
        return ItemInteractionResult.SUCCESS;
    }
}