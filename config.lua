Config = {}
Config.AutoRespawn = true          -- true == stores cars in garage on restart | false == doesnt modify car states
Config.VisuallyDamageCars = true   -- true == damage car on spawn | false == no damage on spawn
Config.SharedGarages = false       -- true == take any car from any garage | false == only take car from garage stored in
Config.ClassSystem = false         -- true == restrict vehicles by class | false == any vehicle class in any garage
Config.FuelResource = 'cdn-fuel' -- supports any that has a GetFuel() and SetFuel() export
Config.Warp = true                 -- true == warp player into vehicle | false == vehicle spawns without warping

-- https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.VehicleClass = {
    all = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22 },
    car = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 18, 22 },
    air = { 15, 16 },
    sea = { 14 },
    rig = { 10, 11, 17, 19, 20 }
}

Config.Garages = {
    motelgarage = {
        label = 'Motel Parking',
        takeVehicle = vector3(274.29, -334.15, 44.92),
        zone = {
            shape = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
                vector2(267.63858032227, -314.39105224609),
                vector2(258.39846801758, -343.55117797852),
                vector2(294.19735717773, -357.86618041992),
                vector2(305.30615234375, -328.1120300293)
            },
            minZ = 44.019950866699,
            maxZ = 46.019950866699,
            -- VERY IMPORTANT: Make sure the parking zone is high enough - higher than the tallest vehicle and LOW ENOUGH / touches the ground (turn on debug to see)
        },
        spawnPoint = {
            vector4(293.39, -349.81, 44.3, 70.47),
            vector4(294.46, -346.47, 44.28, 70.88),
            vector4(296.17, -343.33, 44.28, 70.95),
            vector4(297.12, -339.86, 44.28, 69.71),
            vector4(297.12, -339.86, 44.28, 69.71),
            vector4(299.19, -333.34, 44.28, 69.18),
            vector4(300.49, -330.19, 44.28, 69.65),
            vector4(289.12, -326.04, 44.28, 248.97),
            vector4(287.82, -329.17, 44.28, 249.77),
            vector4(286.66, -332.5, 44.28, 247.69),
            vector4(285.53, -335.87, 44.28, 249.13),
            vector4(283.95, -338.96, 44.28, 248.97),
            vector4(282.82, -342.1, 44.28, 250.36),
            vector4(284.0, -324.15, 44.28, 69.37),
            vector4(282.27, -327.17, 44.28, 69.86),
            vector4(281.0, -330.42, 44.28, 68.27),
            vector4(279.91, -333.71, 44.28, 67.28),
            vector4(278.35, -336.77, 44.28, 69.7),
            vector4(277.37, -340.19, 44.28, 68.41),
            vector4(271.08, -319.43, 44.28, 248.7),
            vector4(269.26, -322.4, 44.28, 249.16),
            vector4(268.23, -325.67, 44.28, 251.47),
            vector4(267.5, -328.99, 44.28, 250.96),
            vector4(265.85, -332.07, 44.28, 249.44)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    centralgarage = {
        label = 'Central Parking',
        takeVehicle = vector3(-339.84, -950.17, 31.08),
        zone = {
            shape = {
                vector2(-296.09201049805, -994.65716552734),
                vector2(-289.47674560547, -977.46795654297),
                vector2(-311.38293457031, -969.45544433594),
                vector2(-297.59646606445, -932.39306640625),
                vector2(-303.55172729492, -930.34942626953),
                vector2(-299.19586181641, -919.42077636719),
                vector2(-283.47738647461, -924.80590820313),
                vector2(-274.578125, -903.31695556641),
                vector2(-286.48037719727, -899.36907958984),
                vector2(-282.9416809082, -884.96807861328),
                vector2(-350.70758056641, -871.04998779297),
                vector2(-349.44689941406, -886.24871826172),
                vector2(-364.03149414063, -887.28753662109),
                vector2(-364.0007019043, -969.94665527344)
            },
            minZ = 30.019950866699,
            maxZ = 32.019950866699,
        },
        spawnPoint = {
            vector4(-337.43, -952.39, 30.44, 68.35),
            vector4(-335.61, -949.25, 30.44, 69.7),
            vector4(-334.79, -945.46, 30.44, 68.9),
            vector4(-333.6, -941.9, 30.44, 69.48),
            vector4(-332.33, -938.43, 30.44, 69.47),
            vector4(-330.78, -935.07, 30.44, 70.16),
            vector4(-329.71, -931.47, 30.44, 68.51),
            vector4(-328.62, -927.9, 30.44, 67.79),
            vector4(-326.73, -924.76, 30.44, 68.88),
            vector4(-345.59, -931.81, 30.44, 249.99),
            vector4(-344.18, -928.71, 30.44, 249.12),
            vector4(-341.99, -925.34, 30.44, 248.9),
            vector4(-341.54, -921.4, 30.44, 251.1),
            vector4(-326.64, -956.22, 30.44, 250.6),
            vector4(-325.89, -952.69, 30.44, 249.95),
            vector4(-324.56, -949.29, 30.44, 245.45),
            vector4(-322.87, -945.7, 30.44, 249.31),
            vector4(-322.05, -942.01, 30.44, 248.23),
            vector4(-320.45, -939.04, 30.44, 249.98),
            vector4(-319.32, -935.42, 30.44, 251.04),
            vector4(-317.97, -932.0, 30.44, 249.52),
            vector4(-317.11, -928.22, 30.44, 249.91),
            vector4(-306.85, -947.77, 30.44, 69.53),
            vector4(-307.89, -951.3, 30.44, 68.89),
            vector4(-309.48, -954.55, 30.44, 69.89),
            vector4(-310.93, -957.85, 30.44, 68.71),
            vector4(-312.2, -961.4, 30.44, 71.56),
            vector4(-313.37, -964.95, 30.44, 70.2),
            vector4(-297.63, -989.83, 30.44, 340.41),
            vector4(-301.22, -989.27, 30.44, 338.58),
            vector4(-304.6, -987.54, 30.44, 340.19),
            vector4(-308.02, -986.37, 30.44, 341.47),
            vector4(-311.57, -985.32, 30.44, 340.63),
            vector4(-315.0, -983.77, 30.44, 339.04),
            vector4(-318.47, -982.31, 30.44, 340.03),
            vector4(-321.88, -981.2, 30.44, 339.47),
            vector4(-325.51, -979.86, 30.44, 340.83),
            vector4(-328.97, -979.01, 30.44, 339.26),
            vector4(-332.54, -977.77, 30.44, 339.0),
            vector4(-335.79, -976.18, 30.44, 338.1)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    -- sapcounsel = {
    --     label = 'San Andreas Parking',
    --     takeVehicle = vector3(-330.01, -780.33, 33.96),
    --     spawnPoint = {
    --         vector4(-341.57, -767.45, 33.56, 92.61)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- spanishave = {
    --     label = 'Spanish Ave Parking',
    --     takeVehicle = vector3(-1160.86, -741.41, 19.63),
    --     spawnPoint = {
    --         vector4(-1145.2, -745.42, 19.26, 108.22)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- caears24 = {
    --     label = 'Caears 24 Parking',
    --     takeVehicle = vector3(69.84, 12.6, 68.96),
    --     spawnPoint = {
    --         vector4(60.8, 17.54, 68.82, 339.7)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- caears242 = {
    --     label = 'Caears 24 Parking',
    --     takeVehicle = vector3(-453.7, -786.78, 30.56),
    --     spawnPoint = {
    --         vector4(-472.39, -787.71, 30.14, 180.52)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- lagunapi = {
    --     label = 'Laguna Parking',
    --     takeVehicle = vector3(364.37, 297.83, 103.49),
    --     spawnPoint = {
    --         vector4(375.09, 294.66, 102.86, 164.04)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- airportp = {
    --     label = 'Airport Parking',
    --     takeVehicle = vector3(-773.12, -2033.04, 8.88),
    --     spawnPoint = {
    --         vector4(-779.77, -2040.18, 8.47, 315.34)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- beachp = {
    --     label = 'Beach Parking',
    --     takeVehicle = vector3(-1185.32, -1500.64, 4.38),
    --     spawnPoint = {
    --         vector4(-1188.14, -1487.95, 3.97, 124.06)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- themotorhotel = {
    --     label = 'The Motor Hotel Parking',
    --     takeVehicle = vector3(1137.77, 2663.54, 37.9),
    --     spawnPoint = {
    --         vector4(1127.7, 2647.84, 37.58, 1.41)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- liqourparking = {
    --     label = 'Liqour Parking',
    --     takeVehicle = vector3(883.99, 3649.67, 32.87),
    --     spawnPoint = {
    --         vector4(898.38, 3649.41, 32.36, 90.75)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    mirror = {
        label = 'Mirro Parking',
        zone = {
            shape = {
                vector2(-1316.0959472656, -1130.9549560547),
                vector2(-1321.2368164062, -1130.7243652344),
                vector2(-1321.236328125, -1153.6495361328),
                vector2(-1316.0729980469, -1153.7891845703)
            },
            minZ = 3.49,
            maxZ = 5.49,
        },
        takeVehicle = vector3(-1323.59, -1143.19, 4.42),
        spawnPoint = {
            vector4(-1318.73, -1134.5, 4.16, 92.02),
            vector4(-1318.95, -1137.66, 4.1, 91.53),
            vector4(-1318.65, -1141.34, 4.11, 91.91),
            vector4(-1318.84, -1145.17, 4.11, 90.96),
            vector4(-1318.79, -1148.51, 4.11, 90.73),
            vector4(-1318.91, -1151.8, 4.17, 93.47)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    lake = {
        label = 'Lake Parking',
        zone = {
            shape = {
                vector2(1007.247253418, -764.10473632812),
                vector2(1031.0369873047, -794.39038085938),
                vector2(1048.7291259766, -794.59844970703),
                vector2(1049.6694335938, -769.24688720703),
                vector2(1023.3350219727, -752.16235351562)
            },
            minZ = 56.99,
            maxZ = 58.99,
        },
        takeVehicle = vector3(1033.26, -765.09, 58.18),
        spawnPoint = {
            vector4(1015.81, -770.93, 57.5, 309.54),
            vector4(1018.11, -773.4, 57.51, 308.59),
            vector4(1020.46, -776.4, 57.49, 307.65),
            vector4(1022.86, -779.29, 57.49, 308.93),
            vector4(1025.28, -782.39, 57.48, 312.74),
            vector4(1028.17, -770.94, 57.64, 144.68),
            vector4(1030.81, -773.45, 57.67, 144.24),
            vector4(1027.38, -785.17, 57.48, 307.49),
            vector4(1029.67, -788.07, 57.47, 307.16),
            vector4(1046.53, -782.19, 57.61, 89.95),
            vector4(1046.35, -785.59, 57.6, 91.31),
            vector4(1046.42, -778.44, 57.62, 90.24)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    casino = {
        label = 'Casino Parking',
        zone = {
            shape = {
                vector2(870.03948974609, -5.4726943969727),
                vector2(847.56652832031, -40.945533752441),
                vector2(865.67010498047, -51.732013702393),
                vector2(887.86694335938, -16.47052192688)
            },
            minZ = 77.84,
            maxZ = 79.84,
        },
        takeVehicle = vector3(873.51, -18.32, 78.76),
        spawnPoint = {
            vector4(883.07, -16.32, 78.37, 56.82),
            vector4(880.76, -18.67, 78.37, 59.06),
            vector4(879.29, -21.71, 78.37, 59.02),
            vector4(877.7, -24.92, 78.37, 57.79),
            vector4(875.82, -27.81, 78.37, 56.62),
            vector4(873.96, -30.49, 78.37, 56.82),
            vector4(872.26, -33.9, 78.37, 55.92),
            vector4(860.58, -26.35, 78.37, 236.42),
            vector4(862.75, -23.65, 78.37, 238.06),
            vector4(864.37, -20.8, 78.37, 238.69),
            vector4(866.36, -17.89, 78.37, 237.8),
            vector4(867.88, -14.83, 78.37, 239.22)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    cardealer = {
        label = 'Cardealer Parking',
        zone = {
            shape = {
                vector2(-2134.3271484375, -384.27459716797),
                vector2(-2133.3718261719, -377.83734130859),
                vector2(-2155.8542480469, -370.9162902832),
                vector2(-2158.1000976562, -378.20223999023)
            },
            minZ = 12.14,
            maxZ = 14.14,
        },
        takeVehicle = vector3(-2143.43, -377.56, 13.42),
        spawnPoint = {
            vector4(-2154.78, -375.96, 12.72, 169.16),
            vector4(-2151.38, -377.03, 12.74, 166.66),
            vector4(-2148.47, -377.78, 12.75, 168.3),
            vector4(-2145.44, -378.46, 12.78, 167.38),
            vector4(-2142.63, -379.39, 12.8, 165.48),
            vector4(-2139.42, -380.14, 12.81, 165.9),
            vector4(-2136.32, -380.62, 12.8, 168.35)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    nightclub = {
        label = 'night club Parking',
        zone = {
            shape = {
                vector2(151.52871704102, -3181.6948242188),
                vector2(151.37957763672, -3212.7797851562),
                vector2(125.19873809814, -3212.7885742188),
                vector2(125.05079650879, -3181.6921386719)
            },
            minZ = 4.85,
            maxZ = 6.85,
        },
        takeVehicle = vector3(142.02, -3196.91, 5.86),
        spawnPoint = {
            vector4(147.09, -3183.54, 5.46, 179.07),
            vector4(146.66, -3190.63, 5.47, 178.68),
            vector4(140.66, -3190.41, 5.46, 180.61),
            vector4(140.59, -3183.81, 5.47, 180.66),
            vector4(134.91, -3183.74, 5.46, 179.06)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    mining = {
        label = 'Mining Parking',
        zone = {
            shape = {
                vector2(2481.5021972656, 1586.6632080078),
                vector2(2465.2097167969, 1586.8752441406),
                vector2(2465.1166992188, 1580.2175292969),
                vector2(2453.3491210938, 1569.5010986328),
                vector2(2453.3491210938, 1563.8603515625),
                vector2(2478.7795410156, 1563.8167724609)
            },
            minZ = 31.72,
            maxZ = 33.72,
        },
        takeVehicle = vector3(2473.28, 1566.84, 32.33),
        spawnPoint = {
            vector4(2473.28, 1566.84, 32.33, 0.45),
            vector4(2477.1, 1584.29, 32.33, 179.32),
            vector4(2473.79, 1583.83, 32.33, 181.05),
            vector4(2470.28, 1583.89, 32.33, 181.52),
            vector4(2479.85, 1583.91, 32.33, 179.28)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    blackmarket = {
        label = 'blackmarket Parking',
        zone = {
            shape = {
                vector2(3123.005859375, 5426.7880859375),
                vector2(3112.6850585938, 5444.6733398438),
                vector2(3096.9467773438, 5436.1215820312),
                vector2(3107.4113769531, 5417.857421875)
            },
            minZ = 31.72,
            maxZ = 33.72,
        },
        takeVehicle = vector3(2473.28, 1566.84, 32.33),
        spawnPoint = {
            vector4(3109.03, 5422.41, 23.57, 273.78),
            vector4(3109.03, 5422.41, 23.57, 273.78)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    carter = {
        label = 'Carter Parking',
        zone = {
            shape = {
                vector2(3431.9350585938, 4888.8486328125),
                vector2(3439.1691894531, 4883.8159179688),
                vector2(3450.5661621094, 4896.0727539062),
                vector2(3444.6955566406, 4901.306640625)
            },
            minZ = 35.00,
            maxZ = 37.00,
        },
        takeVehicle = vector3(3442.53, 4894.19, 36.0),
        spawnPoint = {
            vector4(3437.86, 4887.82, 35.61, 46.46),
            vector4(3442.88, 4892.87, 35.6, 41.1)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    rodriguez = {
        label = 'Rodriguez Parking',
        zone = {
            shape = {
                vector2(-3064.96484375, 1483.7536621094),
                vector2(-3045.8352050781, 1487.1804199219),
                vector2(-3047.2817382812, 1498.9927978516),
                vector2(-3066.8806152344, 1496.2478027344)
            },
            minZ = 36.27,
            maxZ = 38.27,
        },
        takeVehicle = vector3(-3055.84, 1494.7, 37.28),
        spawnPoint = {
            vector4(-3062.88, 1487.74, 36.89, 7.82),
            vector4(-3059.18, 1488.0, 36.89, 8.22),
            vector4(-3055.36, 1488.61, 36.89, 11.55),
            vector4(-3051.98, 1489.16, 36.89, 8.11),
            vector4(-3048.53, 1489.87, 36.89, 5.61)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    armada = {
        label = 'Armada Parking',
        zone = {
            shape = {
                vector2(828.19573974609, 3427.7001953125),
                vector2(828.04730224609, 3444.2734375),
                vector2(808.36199951172, 3444.8688964844),
                vector2(808.36694335938, 3438.1479492188)
            },
            minZ = 56.85,
            maxZ = 58.85,
        },
        takeVehicle = vector3(817.84, 3433.62, 57.46),
        spawnPoint = {
            vector4(825.85, 3442.29, 57.46, 182.08),
            vector4(820.81, 3442.3, 57.46, 179.51),
            vector4(815.91, 3442.74, 57.46, 178.74),
            vector4(810.83, 3442.62, 57.47, 177.99)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    shoreparking = {
        label = 'Shore Parking',
        zone = {
            shape = {
                vector2(1748.0808105469, 3711.8063964844),
                vector2(1738.5590820313, 3733.1381835938),
                vector2(1714.6356201172, 3721.67578125),
                vector2(1722.2064208984, 3704.3276367188)
            },
            minZ = 32.889950866699,
            maxZ = 34.019950866699,
        },
        takeVehicle = vector3(1737.03, 3718.88, 34.05),
        spawnPoint = {
            vector4(1739.92, 3716.1, 33.45, 21.63),
            vector4(1735.54, 3714.19, 33.48, 20.58)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    haanparking = {
        label = 'Bell Farms Parking',
        zone = {
            shape = {
                vector2(67.040328979492, 6415.5810546875),
                vector2(-25.122016906738, 6323.75),
                vector2(-11.668456077576, 6304.4697265625),
                vector2(109.81146240234, 6372.2202148438)
            },
            minZ = 30.019950866699,
            maxZ = 32.019950866699,
        },
        takeVehicle = vector3(76.88, 6397.3, 31.23),
        spawnPoint = {
            vector4(72.1, 6404.47, 30.58, 135.43),
            vector4(75.31, 6401.36, 30.58, 132.96),
            vector4(77.89, 6398.39, 30.58, 136.05),
            vector4(80.86, 6396.1, 30.58, 134.47),
            vector4(59.67, 6400.91, 30.58, 217.2),
            vector4(59.67, 6400.91, 30.58, 217.2),
            vector4(64.68, 6406.7, 30.58, 211.84),
            vector4(66.4, 6379.98, 30.6, 35.64),
            vector4(63.37, 6377.44, 30.6, 32.38),
            vector4(60.47, 6375.04, 30.6, 32.78)

        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    -- dumbogarage = {
    --     label = 'Dumbo Private Parking',
    --     takeVehicle = vector3(165.75, -3227.2, 5.89),
    --     spawnPoint = {
    --         vector4(168.34, -3236.1, 5.43, 272.05)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- pillboxgarage = {
    --     label = 'Pillbox Garage Parking',
    --     takeVehicle = vector3(213.2, -796.05, 30.86),
    --     spawnPoint = {
    --         vector4(222.02, -804.19, 30.26, 248.19),
    --         vector4(223.93, -799.11, 30.25, 248.53),
    --         vector4(226.46, -794.33, 30.24, 248.29),
    --         vector4(232.33, -807.97, 30.02, 69.17),
    --         vector4(234.42, -802.76, 30.04, 67.2)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    -- grapeseedgarage = {
    --     label = 'Grapeseed Parking',
    --     takeVehicle = vector3(2552.68, 4671.8, 33.95),
    --     spawnPoint = {
    --         vector4(2550.17, 4681.96, 33.81, 17.05)
    --     },
    --     showBlip = true,
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'public',
    --     category = Config.VehicleClass['car']
    -- },
    depotLot = {
        label = 'Depot Lot',
        takeVehicle = vector3(401.76, -1632.57, 29.29),
        zone = {
            shape = {
                vector2(411.75018310547, -1619.7192382812),
                vector2(406.21807861328, -1626.2105712891),
                vector2(403.39260864258, -1623.6715087891),
                vector2(388.09436035156, -1641.982421875),
                vector2(410.87994384766, -1660.5321044922),
                vector2(423.43499755859, -1645.0350341797),
                vector2(423.10702514648, -1628.1901855469)
            },
            minZ = 27.019950866699,
            maxZ = 31.019950866699,
        },
        spawnPoint = {
            vector4(410.97, -1656.46, 28.66, 320.75),
            vector4(408.44, -1654.62, 28.66, 321.12),
            vector4(405.62, -1652.84, 28.67, 318.71),
            vector4(403.29, -1650.45, 28.67, 318.35),
            vector4(400.94, -1648.48, 28.67, 317.55),
            vector4(398.43, -1646.93, 28.67, 319.89),
            vector4(396.18, -1644.76, 28.67, 317.7),
            vector4(418.31, -1646.32, 28.66, 48.59)
        },
        showBlip = true,
        blipName = 'Depot Lot',
        blipNumber = 68,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['car']
    },
    depotLotNord = {
        label = 'Depot Lot Nord',
        takeVehicle = vector3(-406.34, 6163.87, 31.54),
        zone = {
            shape = {
                vector2(-397.79446411133, 6154.513671875),
                vector2(-390.42739868164, 6162.1098632812),
                vector2(-413.61340332031, 6186.4052734375),
                vector2(-421.85897827148, 6177.6879882812)
            },
            minZ = 30.419950866699,
            maxZ = 32.419950866699,
        },
        spawnPoint = {
            vector4(-400.61, 6161.88, 31.08, 353.93),
            vector4(-403.58, 6165.09, 31.13, 353.89),
            vector4(-406.23, 6167.49, 31.11, 354.28),
            vector4(-412.0, 6173.58, 31.09, 350.22),
            vector4(-409.32, 6170.57, 31.08, 352.72),
        },
        showBlip = true,
        blipName = 'Depot Lot Nord',
        blipNumber = 68,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['car']
    },
    depotpolice = {
        label = 'Depot leo',
        takeVehicle = vector3(-406.34, 6163.87, 31.54),
        zone = {
            shape = {
                vector2(-573.55285644531, -388.16152954102),
                vector2(-579.34020996094, -388.18280029297),
                vector2(-579.46160888672, -406.25006103516),
                vector2(-573.62390136719, -406.42141723633)
            },
            minZ = 30.16,
            maxZ = 32.16,
        },
        spawnPoint = {
            vector4(-576.16, -390.5, 30.84, 90.16),
            vector4(-576.76, -393.95, 30.84, 89.36),
            vector4(-576.82, -397.59, 30.84, 89.07),
            vector4(-576.72, -401.63, 30.84, 90.58),
            vector4(-576.84, -404.74, 30.84, 89.41)
        },
        showBlip = false,
        blipName = 'Depot leo',
        blipNumber = 68,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['car']
    },
    depotbcso = {
        label = 'Depot bcso',
        takeVehicle = vector3(1815.96, 3665.75, 33.84),
        zone = {
            shape = {
                vector2(1813.6011962891, 3662.8454589844),
                vector2(1808.2103271484, 3672.0483398438),
                vector2(1812.68359375, 3674.7270507812),
                vector2(1818.2653808594, 3665.5314941406)
            },
            minZ = 33.18,
            maxZ = 35.18,
        },
        spawnPoint = {
            vector4(1815.96, 3665.75, 33.84, 302.01),
            vector4(1813.53, 3669.1, 33.86, 300.4),
            vector4(1812.22, 3672.39, 33.87, 300.7)
        },
        showBlip = false,
        blipName = 'Depot bcso',
        blipNumber = 68,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['car']
    },
    depotpaletto = {
        label = 'Depot paletto',
        takeVehicle = vector3(-406.34, 6163.87, 31.54),
        zone = {
            shape = {
                vector2(-457.33947753906, 6051.044921875),
                vector2(-444.87194824219, 6059.498046875),
                vector2(-442.20953369141, 6054.0302734375),
                vector2(-452.60446166992, 6046.6831054688)
            },
            minZ = 30.34,
            maxZ = 32.34,
        },
        spawnPoint = {
            vector4(-453.1, 6050.28, 31.02, 220.51),
            vector4(-449.01, 6052.84, 31.02, 213.82),
            vector4(-445.42, 6055.54, 31.02, 208.93)
        },
        showBlip = false,
        blipName = 'Depot bcso',
        blipNumber = 68,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['car']
    },

    -- ballas = {
    --     label = 'Ballas',
    --     takeVehicle = vector3(87.51, -1969.1, 20.75),
    --     spawnPoint = {
    --         vector4(93.78, -1961.73, 20.34, 319.11)
    --     },
    --     showBlip = false,
    --     blipName = 'Ballas',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'gang',
    --     category = Config.VehicleClass['car'], --car, air, sea, rig
    --     job = 'ballas',
    --     jobType = 'ballas'
    -- },
    -- families = {
    --     label = 'Families',
    --     takeVehicle = vector3(-23.89, -1436.03, 30.65),
    --     spawnPoint = {
    --         vector4(-25.47, -1445.76, 30.24, 178.5)
    --     },
    --     showBlip = false,
    --     blipName = 'Families',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'gang',
    --     category = Config.VehicleClass['car'], --car, air, sea, rig
    --     job = 'families',
    --     jobType = 'families'
    -- },
    -- lostmc = {
    --     label = 'Lost MC',
    --     takeVehicle = vector3(985.83, -138.14, 73.09),
    --     spawnPoint = {
    --         vector4(977.65, -133.02, 73.34, 59.39)
    --     },
    --     showBlip = false,
    --     blipName = 'Lost MC',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'gang',
    --     category = Config.VehicleClass['car'], --car, air, sea, rig
    --     job = 'lostmc',
    --     jobType = 'lostmc'
    -- },
    -- cartel = {
    --     label = 'Cartel',
    --     takeVehicle = vector3(1411.67, 1117.8, 114.84),
    --     spawnPoint = {
    --         vector4(1403.01, 1118.25, 114.84, 88.69)
    --     },
    --     showBlip = false,
    --     blipName = 'Cartel',
    --     blipNumber = 357,
    --     blipColor = 0,
    --     type = 'gang',
    --     category = Config.VehicleClass['car'],
    --     job = 'cartel',
    --     jobType = 'cartel'
    -- },
    police = {
        label = 'Police',
        takeVehicle = vector3(-598.68, -393.93, 30.52),
        zone = {
            shape = {
                vector2(-602.68939208984, -388.06701660156),
                vector2(-602.88342285156, -422.99731445312),
                vector2(-585.80163574219, -422.53378295898),
                vector2(-585.55786132812, -388.12634277344)
            },
            minZ = 30.16,
            maxZ = 32.16,
        },
        spawnPoint = {
            vector4(-599.45, -390.23, 30.84, 268.99),
            vector4(-599.36, -393.44, 30.84, 270.1),
            vector4(-599.4, -397.24, 30.84, 270.45),
            vector4(-599.35, -404.57, 30.84, 269.21),
            vector4(-599.4, -408.16, 30.84, 268.9),
            vector4(-599.36, -411.81, 30.84, 268.64),
            vector4(-599.39, -415.55, 30.84, 271.82),
            vector4(-599.32, -419.12, 30.84, 270.44),
            vector4(-599.4, -422.72, 30.84, 269.79),
            vector4(-588.07, -419.53, 30.84, 269.79),
            vector4(-588.39, -411.94, 30.84, 267.92),
            vector4(-588.3, -408.18, 30.84, 270.31),
            vector4(-588.03, -404.73, 30.84, 269.7)
        },
        showBlip = false,
        blipName = 'Police',
        blipNumber = 357,
        blipColor = 0,
        type = 'job',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'police',
        jobType = 'leo'
    },
    bcso = {
        label = 'Sherrif',
        takeVehicle = vector3(1859.49, 3693.98, 34.43),
        zone = {
            shape = {
                vector2(1873.2486572266, 3687.4318847656),
                vector2(1862.1466064453, 3681.103515625),
                vector2(1849.1208496094, 3703.37890625),
                vector2(1861.6126708984, 3707.6049804688)
            },
            minZ = 32.019950866699,
            maxZ = 35.019950866699,
        },
        spawnPoint = {
            vector4(1869.28, 3687.23, 33.05, 120.12),
            vector4(1867.38, 3690.7, 33.1, 120.15),
            vector4(1865.38, 3693.6, 33.11, 119.51),
            vector4(1863.8, 3697.37, 33.1, 120.25),
            vector4(1861.97, 3700.87, 33.1, 120.25),
            vector4(1860.13, 3704.45, 33.09, 121.05),
        },
        showBlip = false,
        blipName = 'Sherrif',
        blipNumber = 357,
        blipColor = 0,
        type = 'job',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'bcso',
        jobType = 'leo'
    },
    bcsopaleto = {
        label = 'Sherrif',
        takeVehicle = vector3(-476.01, 6025.45, 31.34),
        zone = {
            shape = {
                vector2(-450.30178833008, 6041.40625),
                vector2(-460.90432739258, 6051.8706054688),
                vector2(-488.33441162109, 6024.427734375),
                vector2(-477.79156494141, 6013.8125)
            },
            minZ = 30.319950866699,
            maxZ = 32.319950866699,
        },
        spawnPoint = {
            vector4(-482.72, 6025.12, 30.95, 224.50),
            vector4(-479.62, 6027.75, 30.95, 223.10),
            vector4(-472.21, 6035.33, 30.95, 225.95),
            vector4(-461.14, 6047.44, 30.95, 137.41),
            vector4(-458.20, 6044.29, 30.95, 135.63),
        },
        showBlip = false,
        blipName = 'Sherrif',
        blipNumber = 357,
        blipColor = 0,
        type = 'job',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'bcso',
        jobType = 'leo'
    },
    intairport = {
        label = 'Airport Hangar',
        takeVehicle = vector3(-979.06, -2995.48, 13.95),
        zone = {
            shape = {
                vector2(-988.62725830078, -3000.5405273438),
                vector2(-979.84320068359, -2984.6083984375),
                vector2(-969.06640625, -2990.7717285156),
                vector2(-977.34497070312, -3006.4653320312)
            },
            minZ = 11.019950866699,
            maxZ = 15.019950866699,
        },
        spawnPoint = {
            vector4(-978.15, -2990.34, 13.32, 65.44),
            vector4(-984.54, -2999.84, 13.32, 58.77)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    higginsheli = {
        label = 'Higgins Helitours',
        takeVehicle = vector3(-722.15, -1472.79, 5.0),
        zone = {
            shape = {
                vector2(-758.50836181641, -1469.9782714844),
                vector2(-744.5380859375, -1481.6302490234),
                vector2(-712.20745849609, -1443.2182617188),
                vector2(-725.38098144531, -1431.7524414062)
            },
            minZ = 3.019950866699,
            maxZ = 7.019950866699,
        },
        spawnPoint = {
            vector4(-745.22, -1468.72, 5.39, 319.84),
            vector4(-724.36, -1443.61, 5.39, 135.78)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    airsshores = {
        label = 'Sandy Shores Hangar',
        takeVehicle = vector3(1737.89, 3288.13, 41.14),
        zone = {
            shape = {
                vector2(1751.0200195312, 3253.6936035156),
                vector2(1748.1513671875, 3282.5402832031),
                vector2(1728.4143066406, 3281.9548339844),
                vector2(1730.5595703125, 3249.611328125)
            },
            minZ = 40.019950866699,
            maxZ = 42.019950866699,
        },
        spawnPoint = {
            vector4(1742.83, 3266.83, 41.24, 102.64)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    airzancudo = {
        label = 'Fort Zancudo Hangar',
        takeVehicle = vector3(-1828.25, 2975.44, 32.81),
        zone = {
            shape = {
                vector2(-1812.6203613281, 2976.1452636719),
                vector2(-1835.3525390625, 2989.4782714844),
                vector2(-1845.9986572266, 2972.4047851562),
                vector2(-1823.4010009766, 2957.1171875)
            },
            minZ = 30.019950866699,
            maxZ = 34.019950866699,
        },
        spawnPoint = {
            vector4(-1828.25, 2975.44, 32.81, 57.24)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    airdepot = {
        label = 'Air Depot',
        takeVehicle = vector3(-1270.01, -3377.53, 14.33),
        zone = {
            shape = {
                vector2(-1248.9865722656, -3380.0737304688),
                vector2(-1274.2775878906, -3364.365234375),
                vector2(-1285.97265625, -3381.6142578125),
                vector2(-1263.0495605469, -3394.4047851562)
            },
            minZ = 11.019950866699,
            maxZ = 14.019950866699,
        },
        spawnPoint = {
            vector4(-1270.01, -3377.53, 14.33, 329.25)
        },
        showBlip = true,
        blipName = 'Air Depot',
        blipNumber = 359,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['air']
    },
    lsymc = {
        label = 'LSYMC Boathouse',
        takeVehicle = vector3(-785.95, -1497.84, -0.09),
        zone = {
            shape = {
                vector2(-787.84265136719, -1492.4404296875),
                vector2(-811.28533935547, -1501.3481445312),
                vector2(-806.55834960938, -1513.0714111328),
                vector2(-782.34558105469, -1504.1981201172)
            },
            minZ = -1.5019950866699,
            maxZ = 1.019950866699,
        },
        spawnPoint = {
            vector4(-796.64, -1502.6, -0.09, 111.49)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['sea']
    },
    paleto = {
        label = 'Paleto Boathouse',
        takeVehicle = vector3(-278.21, 6638.13, 7.55),
        zone = {
            shape = {
                vector2(-286.16806030273, 6631.56640625),
                vector2(-299.78063964844, 6642.90625),
                vector2(-284.54107666016, 6663.482421875),
                vector2(-269.02484130859, 6649.4760742188)
            },
            minZ = -1.5019950866699,
            maxZ = 1.019950866699,
        },
        spawnPoint = {
            vector4(-289.2, 6637.96, 1.01, 45.5)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['sea']
    },
    millars = {
        label = 'Millars Boathouse',
        takeVehicle = vector3(1298.56, 4212.42, 33.25),
        zone = {
            shape = {
                vector2(1310.8342285156, 4211.5859375),
                vector2(1306.1059570312, 4191.7177734375),
                vector2(1287.3016357422, 4191.6162109375),
                vector2(1287.2047119141, 4217.548828125)
            },
            minZ = 27.5019950866699,
            maxZ = 30.019950866699,
        },
        spawnPoint = {
            vector4(1297.82, 4209.61, 30.12, 253.5)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 0,
        type = 'public',
        category = Config.VehicleClass['sea']
    },
    seadepot = {
        label = 'LSYMC Depot',
        takeVehicle = vector3(-742.95, -1407.58, 5.5),
        zone = {
            shape = {
                vector2(-725.28265380859, -1338.3333740234),
                vector2(-710.76458740234, -1350.0482177734),
                vector2(-725.02581787109, -1366.4116210938),
                vector2(-737.95306396484, -1356.6075439453)
            },
            minZ = -1.5019950866699,
            maxZ = 1.019950866699,
        },
        spawnPoint = {
            vector4(-729.77, -1355.49, 1.19, 142.5)
        },
        showBlip = true,
        blipName = 'LSYMC Depot',
        blipNumber = 356,
        blipColor = 0,
        type = 'depot',
        category = Config.VehicleClass['sea']
    },
}
