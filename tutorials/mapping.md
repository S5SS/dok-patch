# Deserts of Kharak Mapping Tutorial
In order to create custom maps you need the More Maps mod. Find the install directory of DoK `(Steam Client->Library->Right Click Deserts of Kharak->Properties...->Local Files->Browse Local Files)`. Then goto `Data/Managed/maps` (location for easy manual installation) where you should see a bunch of `.dokmap` files. To create the map mod modify the map file that belongs to the map you want to change. After each change to the file you only need to restart the level, you don't have to restart the whole game.

## Map format
The layout of maps are stored in XML, this is the XML for Khashar Approach:
```
<?xml version="1.0" encoding="UTF-8"?>
<dokmap>
	<name>Khashar Approach</name>
	<map>M10</map>
	<description>Test Map</description>
	<authors>SSSS</authors>
	<players>6</players>
	
	<spawns>
		<!-- team 1 -->
		<spawn team="0" index="0" x="-3032" z="2622" angle="90"/>
		<spawn team="0" index="1" x="-4688" z="1344" angle="0"/>
		<spawn team="0" index="2" x="-6836" z="-2852" angle="0"/>
		<!-- team 2 -->
		<spawn team="1" index="0" x="4278" z="-2819" angle="0"/>
		<spawn team="1" index="1" x="2655" z="-4245" angle="0"/>
		<spawn team="1" index="2" x="573" z="-6737" angle="0"/>
	</spawns>
	
	<resources>
		<!-- type 0 = cus, type 1 = rus -->
		<!-- team 1 -->
		<resource x="-3332" z="2422" type="0" amount="7500" collectors="2"/>
		<resource x="-3332" z="2622" type="1" amount="3000" collectors="2"/>
		<resource x="-3332" z="2822" type="0" amount="7500" collectors="2"/>
		
		<resource x="-4988" z="1544" type="0" amount="7500" collectors="2"/>
		<resource x="-4988" z="1344" type="1" amount="3000" collectors="2"/>
		<resource x="-4988" z="1144" type="0" amount="7500" collectors="2"/>
		
		<resource x="-7136" z="-3052" type="0" amount="7500" collectors="2"/>
		<resource x="-7136" z="-2852" type="1" amount="3000" collectors="2"/>
		<resource x="-7136" z="-2652" type="0" amount="7500" collectors="2"/>
		
		<resource x="-1475" z="1639" type="0" amount="21000" collectors="4"/>
		<resource x="-1475" z="1439" type="1" amount="8000" collectors="4"/>

		<resource x="-2901" z="81" type="0" amount="10500" collectors="2"/>
		<resource x="-2901" z="-181" type="1" amount="4000" collectors="2"/>
		
		<resource x="-6377" z="-311" type="0" amount="10500" collectors="2"/>
		<resource x="-6377" z="-511" type="1" amount="4000" collectors="2"/>
		
		<resource x="-7828" z="-4229" type="0" amount="10500" collectors="2"/>
		<resource x="-7828" z="-4429" type="1" amount="4000" collectors="2"/>
		
		<resource x="-5290" z="-3820" type="0" amount="10500" collectors="2"/>
		<resource x="-5290" z="-4020" type="1" amount="4000" collectors="2"/>
		
		
		<!-- team 2 -->
		<resource x="4578" z="-2619" type="0" amount="7500" collectors="2"/>
		<resource x="4578" z="-2819" type="1" amount="3000" collectors="2"/>
		<resource x="4578" z="-3019" type="0" amount="7500" collectors="2"/>
		
		<resource x="2955" z="-4045" type="0" amount="7500" collectors="2"/>
		<resource x="2955" z="-4245" type="1" amount="3000" collectors="2"/>
		<resource x="2955" z="-4445" type="0" amount="7500" collectors="2"/>
		
		<resource x="873" z="-6537" type="0" amount="7500" collectors="2"/>
		<resource x="873" z="-6737" type="1" amount="3000" collectors="2"/>
		<resource x="873" z="-6937" type="0" amount="7500" collectors="2"/>
		
		<resource x="2770" z="-1500" type="0" amount="21000" collectors="4"/>
		<resource x="2770" z="-1700" type="1" amount="8000" collectors="4"/>
		
		<resource x="1475" z="-3000" type="0" amount="10500" collectors="2"/>
		<resource x="1475" z="-3200" type="1" amount="4000" collectors="2"/>
		
		<resource x="1800" z="-5440" type="0" amount="10500" collectors="2"/>
		<resource x="1800" z="-5640" type="1" amount="4000" collectors="2"/>
		
		<resource x="-1180" z="-5704" type="0" amount="10500" collectors="2"/>
		<resource x="-1180" z="-5904" type="1" amount="4000" collectors="2"/>
		
		<resource x="-570" z="-8377" type="0" amount="10500" collectors="2"/>
		<resource x="-570" z="-8577" type="1" amount="4000" collectors="2"/>
	</resources>
	
	<artifacts>
		<artifact x="639" z="32"/>
		<artifact x="-770" z="-1475"/>
		<artifact x="-2196" z="-3114"/>
	</artifacts>
	
	<ezs>
		<!-- extraction zones -->
		<!-- only tested 1 per team but the code suggests you can only have 1 at a time -->
		<!-- Kalash Teeth has extraction zones of radius 500 for reference -->
		<ez team="0" x="-4525" z="-7475" radius="1000"/>
		<ez team="1" x="-4525" z="-7475" radius="1000"/>
	</ezs>
	
</dokmap>
```

Node Name | Description | Notes
---|---|---
name | name of the map | (does nothing as of now)
map | map string ID | (does nothing as of now)
description | description of the map | (does nothing as of now)
authors | list of the map authors | (does nothing as of now)
players | max players for this map | (does nothing as of now)
spawn | represents a spawn point | `index` is the player index within a team which means the pair (`team`, `index`) must be unique, 
resource | represents both CU and RU points | `type` represents CU (=0) or RU (=1), `amount` is the amount of that resource and `collectors` is the max number of collectors that can mine at once
artifact | represents an artifact | you can have as many or few artifacts as you want, not just 3
ez | represents an extraction zone | only 1 per team is possible

`<spawns>` `<resources>` `<artifacts>` and `<ezs>` are optional. Positive x points towards 90 degrees in sensors while positive z points towards 0 degrees in sensors. `team="0"` is shown as `Team 1` in game while `team="1"` is shown as `Team 2` in game.

## Calculating Object Locations

The problem now is how do you know what coordinates to give objects? Doing this by trial and error would take far too long. First setup some spawn points like this:

```
<?xml version="1.0" encoding="UTF-8"?>
<dokmap>
	<name>Khashar Approach</name>
	<map>M10</map>
	<description>Test Map</description>
	<authors>SSSS</authors>
	<players>6</players>
	
	<spawns>
		<!-- team 1 -->
		<spawn team="0" index="0" x="0" z="0" angle="0"/>
		<spawn team="0" index="1" x="0" z="0" angle="0"/>
		<spawn team="0" index="2" x="0" z="0" angle="0"/>
		<!-- team 2 -->
		<spawn team="1" index="0" x="0" z="0" angle="90"/>
		<spawn team="1" index="1" x="0" z="0" angle="0"/>
		<spawn team="1" index="2" x="0" z="0" angle="0"/>
	</spawns>
	
	<artifacts>
		<artifact x="0" z="0"/>
		<artifact x="4000" z="0"/>
		<artifact x="0" z="8000"/>
	</artifacts>
</dokmap>
```

Start the map and take a picture looking straight down from as far as possible. This layout will allow you to find the origin, orientation and scale of the map in the image you just took. Its possible that the map isn't centered on (0, 0) and some of these points may be off the map/non existant. If that happens just play around with the values until everything is on the map.
