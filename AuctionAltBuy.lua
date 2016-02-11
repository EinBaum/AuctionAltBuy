
local BrowseButton_OnClick_Old = nil
local AuctionsButton_OnClick_Old = nil

function AR_OnLoad()
	this:RegisterEvent("ADDON_LOADED")
	this:RegisterEvent("AUCTION_HOUSE_SHOW")
end

function AR_OnEvent()
	if (event == "ADDON_LOADED") then
		if (string.lower(arg1) == "auctionaltbuy") then
			DEFAULT_CHAT_FRAME:AddMessage("AuctionAltBuy 1.0 loaded.", 0.37, 1, 0)
		end
	elseif (event == "AUCTION_HOUSE_SHOW") then
		if (not BrowseButton_OnClick_Old) then
			BrowseButton_OnClick_Old = BrowseButton_OnClick
			BrowseButton_OnClick = BrowseButton_OnClick_New
		end
		if (not AuctionsButton_OnClick_Old) then
			AuctionsButton_OnClick_Old = AuctionsButton_OnClick
			AuctionsButton_OnClick = AuctionsButton_OnClick_New
		end
	end
end

function BrowseButton_OnClick_New(button)
	BrowseButton_OnClick_Old(button)
	if (IsAltKeyDown()) then
		PlaceAuctionBid(AuctionFrame.type, GetSelectedAuctionItem(AuctionFrame.type), AuctionFrame.buyoutPrice)
	end
end
function AuctionsButton_OnClick_New(button)
	AuctionsButton_OnClick_Old(button)
	if (IsAltKeyDown()) then
		CancelAuction(GetSelectedAuctionItem("owner"))
	end
end