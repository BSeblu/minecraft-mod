package com.yourname.customblock;

import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.SoundType;
import net.minecraft.world.level.block.state.BlockBehaviour;
import net.minecraft.world.level.material.MapColor;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.neoforge.registries.DeferredHolder;
import net.neoforged.neoforge.registries.DeferredRegister;

public class ModBlocks {
    public static final DeferredRegister<Block> BLOCKS = DeferredRegister.createBlocks(CustomBlockMod.MOD_ID);

    public static final DeferredHolder<Block, CustomBlock> CUSTOM_BLOCK = BLOCKS.register("custom_block", 
        () -> new CustomBlock(BlockBehaviour.Properties.of()
            .mapColor(MapColor.DIAMOND)
            .strength(5.0F, 6.0F)
            .sound(SoundType.METAL)
            .requiresCorrectToolForDrops()));

    public static void register(IEventBus eventBus) {
        BLOCKS.register(eventBus);
    }
}