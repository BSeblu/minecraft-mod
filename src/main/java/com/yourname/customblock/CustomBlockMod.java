package com.yourname.customblock;

import net.neoforged.bus.api.IEventBus;
import net.neoforged.fml.common.Mod;
import net.neoforged.fml.event.lifecycle.FMLCommonSetupEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Mod(CustomBlockMod.MOD_ID)
public class CustomBlockMod {
    public static final String MOD_ID = "customblock";
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomBlockMod.class);

    public CustomBlockMod(IEventBus modEventBus) {
        LOGGER.info("CustomBlock mod is loading!");
        
        ModBlocks.register(modEventBus);
        ModItems.register(modEventBus);
        
        modEventBus.addListener(this::commonSetup);
    }

    private void commonSetup(final FMLCommonSetupEvent event) {
        LOGGER.info("CustomBlock mod setup complete!");
    }
}