package com.yourname.customblock;

import net.minecraft.world.item.BlockItem;
import net.minecraft.world.item.Item;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.neoforge.registries.DeferredHolder;
import net.neoforged.neoforge.registries.DeferredRegister;

public class ModItems {
    public static final DeferredRegister<Item> ITEMS = DeferredRegister.createItems(CustomBlockMod.MOD_ID);

    public static final DeferredHolder<Item, BlockItem> CUSTOM_BLOCK = ITEMS.register("custom_block",
        () -> new BlockItem(ModBlocks.CUSTOM_BLOCK.get(), new Item.Properties()));

    public static void register(IEventBus eventBus) {
        ITEMS.register(eventBus);
    }
}