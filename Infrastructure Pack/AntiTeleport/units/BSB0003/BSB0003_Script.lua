local SShieldLandUnit = import('/lua/seraphimunits.lua').SShieldLandUnit

BSB0003 = Class(SShieldLandUnit) {
    Parent = nil,

    SetParent = function(self, parent, droneName)
        self.Parent = parent
        self.Drone = droneName
    end,

    ShieldEffects = {
       '/effects/emitters/op_seraphim_quantum_jammer_tower_emit.bp',
    },
    
    OnCreate = function(self, builder, layer)
        SShieldLandUnit.OnCreate(self, builder, layer)
    end,
    
    -- Make this unit invulnerable
    OnDamage = function()
    end,
    
    DeathThread = function(self)
        self:Destroy()
    end,
}

TypeClass = BSB0003
