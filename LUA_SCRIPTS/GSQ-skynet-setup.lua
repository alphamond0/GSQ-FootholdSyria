--create a Skynet instance
redIADS = SkynetIADS:create('RedSkynetNorth')

--add SAMS with RUSSIA prefix, add EWRS with USSR prefix
redIADS:addSAMSitesByPrefix('RUSSIA')
redIADS:addEarlyWarningRadarsByPrefix('USSR')


--search for command center and assign to a var
local commandCenter1 = StaticObject.getByName("ccSkynet-1")

--search for substations and assign to a var
local comPowerSource1 = StaticObject.getByName("substation4")
local comPowerSource2 = StaticObject.getByName("substation3")

--search for the connection node
local connectionNode = Unit.getByName("commsSkynet1") 

--local EWREast = getByName("USSR gnd 26")
--local EWRWest = getByName("USSR gnd 28")

--initialize command center and connect power and conenction node
redIADS:addCommandCenter(commandCenter1):addPowerSource(comPowerSource1):addPowerSource(comPowerSource2):addConnectionNode(connectionNode)

--local SA2One = redIADS:getByName("RUSSIA gnd 39")
--local SA2Two = getByName("RUSSIA gnd 40")
--local SA2Three = getByName("RUSSIA gnd 41")
--local SA2Four = getByName("RUSSIA gnd 42")

--iterate through all SA-2 sites in the network and set the connection node and power source, engagement parameters and range and default CC down behaviour
redIADS:getSAMSitesByNatoName('SA-2'):addPowerSource(substation4):addConnectionNode(connectionNode):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(90):setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK)




--redIADS:removeRadioMenu()
--set update interval to every 4 seconds
redIADS:setUpdateInterval(4)

--unleash the IADS
redIADS:activate()

trigger.action.outText("Skynet online.", 30)