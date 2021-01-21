local _, core = ...;
core.Config = {};

local Config = core.Config;
local UIConfig;

------------------------------------------
-- DATABASE
------------------------------------------

local defaults = {
    theme = {
        r = 0,
        g = 0.8, -- 204/255
        b = 1,
        hex = "00ccff"
    }
}


-----------------------------------------
--Config toggle
-----------------------------------------
function Config:Toggle()
    local menu = UIConfig or Config:CreateMenu();
    menu:SetShown(not menu:IsShown());
end

function Config:GetThemeColor()
    local c = defaults.theme;
    return c.r, c.g, c.b, c.hex;

end

function Config:CreateButton(point, relativeFrame, relativePoint, yOffset, text)
	    local btn = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
	    btn:SetPoint(point, relativeFrame, relativePoint, 0, yOffset);
	    btn:SetSize(140, 40);
	    btn:SetText(text);
	    btn:SetNormalFontObject("GameFontNormalLarge");
	    btn:SetHighlightFontObject("GameFontHighlightLarge");
	    return btn;
end

function Config:CreateMenu()
	UIConfig = CreateFrame("Frame", "AuraTrackerConfig", UIParent, "BasicFrameTemplateWithInset");
	UIConfig:SetSize(240, 380);
	UIConfig:SetPoint("CENTER"); 

	UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
	UIConfig.title:SetPoint("LEFT", UIConfig.TitleBg, "LEFT", 5, 0);
	UIConfig.title:SetText("Aura Tracker Options");

    -- NAPPULOITA!!
    -- Save Nappula:
	UIConfig.saveBtn = self:CreateButton("CENTER", UIConfig, "TOP", -70, "Save");

	-- Reset Nappula:	
	UIConfig.resetBtn = self:CreateButton("TOP", UIConfig.saveBtn, "BOTTOM", -10, "Reset");

	-- Load Nappula:	
	UIConfig.loadBtn = self:CreateButton("TOP", UIConfig.resetBtn, "BOTTOM", -10, "Load");

    -- SLAIDEREITA !!

    -- Slider 1:
    UIConfig.slider1 = CreateFrame("SLIDER", nil, UIConfig, "OptionsSliderTemplate");
    UIConfig.slider1:SetPoint("TOP", UIConfig.loadBtn, "BOTTOM", 0, -20);
    UIConfig.slider1:SetMinMaxValues(1, 100);
    UIConfig.slider1:SetValue(50);
    UIConfig.slider1:SetValueStep(30);
    UIConfig.slider1:SetObeyStepOnDrag(true);

    -- Slider 2:
    UIConfig.slider2 = CreateFrame("SLIDER", nil, UIConfig, "OptionsSliderTemplate");
    UIConfig.slider2:SetPoint("TOP", UIConfig.slider1, "BOTTOM", 0, -20);
    UIConfig.slider2:SetMinMaxValues(1, 100);
    UIConfig.slider2:SetValue(40);
    UIConfig.slider2:SetValueStep(30);
    UIConfig.slider2:SetObeyStepOnDrag(true);

    ------------------------------------------------------------------------

    -- CHECK NAPPULAT!!


    -- Check NAPPULA 1:
    UIConfig.checkBtn1 = CreateFrame("CheckButton", nil, UIConfig, "UICheckButtonTemplate");
    UIConfig.checkBtn1:SetPoint("TOPLEFT", UIConfig.slider2, "BOTTOMLEFT", -10, -40);
    UIConfig.checkBtn1.text:SetText("My Check Button :)");


    --Check NAPPULA 2:
    UIConfig.checkBtn2 = CreateFrame("CheckButton", nil, UIConfig, "UICheckButtonTemplate");
    UIConfig.checkBtn2:SetPoint("TOPLEFT", UIConfig.checkBtn1, "BOTTOMLEFT", 0, -10);
    UIConfig.checkBtn2.text:SetText("My other Check Button :)");
    UIConfig.checkBtn2:SetChecked(true);

    UIConfig:Hide();
    return UIConfig;

end
