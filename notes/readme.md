# Basic Unit Modding Tutorial 

First you need a .net decompiler/recompiler (eg dnSpy is pretty good)

open dnSpy->file->open->go to <steam install directory>/steamapps/common/Deserts of Kharak/Data/Managed->select all the DLL files and click open
now you should see a bunch of assemblies listed on the left hand side

## Modding Unit Data:
- open BBI.Game.Data.UnitAttributesData on left hand list which should now show you the code inside that class
- find the thing you want to change (for example we will do health ei you want to change UnitAttributes.MaxHealth)
- right click on the function and click edit method

original:
```
int UnitAttributes.MaxHealth
{
	get
	{
		return this.m_MaxHealth;
	}
}
```

modded:
```
int UnitAttributes.MaxHealth
{
	get
	{
		if (Name == "C_Baserunner_UnitAttributesAsset_MP") return 99999;
		if (Name == "K_ArtilleryCruiser_UnitAttributesAsset_MP") return 1;
		return this.m_MaxHealth;
	}
}
```

- this gives coal br 99999 hp and khaan seige cruiser 1 hp
- unit names are in units.txt (not sure if these are all units in the game but looking through them it seems like all/most)

## Saving:
- once you have made the changes above click compile on the window you used to edit the code with
- then go to file->save all...->ok
- then check in game whether the changes worked, every time you make a change you need to restart dok to make sure it worked

## Modding Weapons:
- process is very similar to above
- first go to BBI.Unity.Game.Data.WeaponAttributesData
- find the thing you want to change and repeat same steps as above:
- weapon names are in weapons.txt

original:
```
Fixed64 WeaponAttributes.BaseDamagePerRound
{
	get
	{
		return Fixed64.FromInt(this.m_BaseDamagePerRound);
	}
}
```
modded:
```
Fixed64 WeaponAttributes.BaseDamagePerRound
{
	get
	{
		if (Name == "K_ArtilleryCruiser_Weapon_BarrageOverDunes_01_MP") return Fixed64.FromInt(0);
		return Fixed64.FromInt(this.m_BaseDamagePerRound);
	}
}
```
## Modding Fixed64:
- Fixed64 is a fixed point number that cant interact directly with int/float etc
- you can add, multiply, divide etc them with each other though
- to make one call Fixed64.FromInt(int) and Fixed.FromConstFloat(float)

Another example:
Potential fix for high ground nukes (not tested):
```
bool WeaponAttributes.ExcludeFromHeightAdvantage
{
	get
	{
		if (Name == "C_Carrier_Weapon_CruiseMissile_MP") return true;
		return this.m_ExcludeFromHeightAdvantage;
	}
}
```

## Modding Abilities:
- same process as above except now the file is BBI.Unity.Game.Data.AbilityAttributesData
