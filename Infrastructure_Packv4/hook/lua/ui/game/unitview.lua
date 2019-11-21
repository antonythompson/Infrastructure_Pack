local version = string.gsub(GetVersion(), '1.5.', '')
version = string.gsub(version, '1.6.', '') -- steam

if version < '3652' then -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function
	LOG('T2_T3_Storage_FAF: [unitview.lua '..debug.getinfo(1).currentline..'] - Gameversion is older then 3652. Hooking "UIFile" to add our own unit icons')

   local MyUnitIdTable = {
	'euabest2',
	'euabest3',
	'euabmst2',
	'euabmst3',

	'euebest2',
	'euebest3',
	'euebmst2',
	'euebmst3',

	'eurbest2',
	'eurbest3',
	'eurbmst2',
	'eurbmst3',

	'exsbest2',
	'exsbest3',
	'exsbmst2',
	'exsbmst3',

	'uab1402',
	'ueb1402',
	'urb1402',
	'xsb1402',

	'xeb0304',
	'xrb0404',
	'xsb0104',
	'xab0104',
	
	'BAB1106',
	'BRB1106',
	'BSB1106',
	'BEB1106',
	
	'BAB1202',
	'BAB1203',
	'BRB1202',
	'BRB1203',
	'BSB1202',
	'BSB1203',
	'BEB1202',
	'BEB1203',

	'BRMBT1PERI',
	'BRNBT1PERI',
	'BROBT1PERI',
	'BRPBT1PERI',
	'BRNBAAFAC',
	'BROBT1HYDENG',
	}
   --unit icon must be in /icons/units/. Put the full path to the /icons/ folder in here - note no / on the end!
   local MyIconPath = "/mods/Jaggeds_Infrastructure_Pack"

   local function IsMyUnit(bpid)
      for i, v in MyUnitIdTable do
         if v == bpid then
            return true
         end
      end
      return false
   end

   local oldUpdateWindow = UpdateWindow
   function UpdateWindow(info)
      oldUpdateWindow(info)
      if IsMyUnit(info.blueprintId) and DiskGetFileInfo(MyIconPath .. '/icons/units/' .. info.blueprintId.. '_icon.dds') then
         controls.icon:SetTexture(MyIconPath .. '/icons/units/' .. info.blueprintId .. '_icon.dds')
      end
   end
end
