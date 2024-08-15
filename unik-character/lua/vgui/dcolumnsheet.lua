/*
   ____ ___  ______   ______  ___ ____ _   _ _____ 
  / ___/ _ \|  _ \ \ / /  _ \|_ _/ ___| | | |_   _|
 | |  | | | | |_) \ V /| |_) || | |  _| |_| | | |  
 | |__| |_| |  __/ | | |  _ < | | |_| |  _  | | |  
  \____\___/|_|    |_| |_| \_\___\____|_| |_| |_|  
                                                   

  Reccpe all copy rights all reserved
  Publishing my respository is prohibited
  
*/

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()

	self.Navigation = vgui.Create( "DScrollPanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 40 )
	self.Navigation:DockMargin( 5, 10, 10, 0 )

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}

end

function PANEL:UseButtonOnlyStyle()
	self.ButtonOnly = true
end

function PANEL:AddSheet( label, panel, material )

	if ( !IsValid( panel ) ) then return end

	local Sheet = {}

	Sheet.Button = vgui.Create( "DImageButton", self.Navigation )

	Sheet.Button:SetImage( material )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall(35)
	Sheet.Button:DockMargin( 0, 5, 0, 10 )

	Sheet.Button.DoClick = function()
		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetVisible( false )

	if ( self.ButtonOnly ) then
		Sheet.Button:SizeToContents()
		--Sheet.Button:SetColor( Color( 150, 150, 150, 100 ) )
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end

	return Sheet
end

function PANEL:SetActiveButton( active )

	if ( self.ActiveButton == active ) then return end

	if ( self.ActiveButton and self.ActiveButton.Target ) then
		self.ActiveButton.Target:SetVisible( false )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
		--self.ActiveButton:SetColor( Color( 150, 150, 150, 100 ) )
	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active:SetSelected( true )
	active:SetToggle( true )
	--active:SetColor( color_white )

	self.Content:InvalidateLayout()

end

derma.DefineControl( "ReccpeUI.ColumnSheet", "", PANEL, "Panel" )