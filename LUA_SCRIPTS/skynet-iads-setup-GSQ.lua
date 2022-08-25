do
--create an instance of the IADS
redIADS = SkynetIADS:create('REDFOR')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default

---end remove debug ---

--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('EW')

--add all groups begining with group name 'SAM' to the IADS:
redIADS:addSAMSitesByPrefix('SAM')

--add a command center and connects the power sources:
--local commandCenter = StaticObject.getByName('REDFOR-CC-1')
--local commPowerSource1 = StaticObject.getByName('CC-POWER-1')
--local commPowerSource2 = StaticObject.getByName('CC-POWER-2')
--redIADS:addCommandCenter(commandCenter):addPowerSource(commPowerSource1)
--redIADS:addPowerSource(commPowerSource2)

--add the main point of failure for this rudimentary SkyNet IADS implementation
--local mainConnectionNode = Unit.getByName('IADS-CommsNode-1')




--add a connection node to this SA-2 site, and set the option for it to go dark, if it looses connection to the IADS:
--local connectionNode = Unit.getByName('IADS-CommsNode-1')
--redIADS:getSAMSiteByGroupName('SAM-SA-2'):addConnectionNode(connectionNode):setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK)

--this SA-2 site will go live at 70% of its max search range:
--redIADS:getSAMSiteByGroupName('SAM-SA-2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--all SA-10 sites shall act as EW sites, meaning their radars will be on all the time:
--redIADS:getSAMSitesByNatoName('SA-10'):setActAsEW(true)

--set the sa15 as point defence for the SA-10 site, we set it to always react to a HARM so we can demonstrate the point defence mechanism in Skynet
--local sa15 = redIADS:getSAMSiteByGroupName('SAM-SA-15-point-defence-SA-10')
--redIADS:getSAMSiteByGroupName('SAM-SA-10'):addPointDefence(sa15):setHARMDetectionChance(100)


--set this SA-11 site to go live 70% of max range of its missiles (default value: 100%), its HARM detection probability is set to 50% (default value: 70%)
--redIADS:getSAMSiteByGroupName('SAM-SA-11'):setGoLiveRangeInPercent(70):setHARMDetectionChance(50)

--this SA-6 site will always react to a HARM being fired at it:
--redIADS:getSAMSiteByGroupName('SAM-SA-6'):setHARMDetectionChance(100)

--set this SA-11 site to go live at maximunm search range (default is at maximung firing range):
--redIADS:getSAMSiteByGroupName('SAM-SA-11-2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()

-- activate the IADS
redIADS:activate()	

--add the jammer
--local jammer = SkynetIADSJammer:create(Unit.getByName('jammer-emitter'), redIADS)
--jammer:masterArmOn()
--jammer:addRadioMenu()

---some special code to remove the jammer aircraft if player is not flying with it in formation, has nothing to do with the IADS:
--local hornet = Unit.getByName('Hornet SA-11-2 Attack')

--end special code

------setup blue IADS:
--blueIADS = SkynetIADS:create('UAE')
--blueIADS:addSAMSitesByPrefix('BLUE-SAM')
--blueIADS:addEarlyWarningRadarsByPrefix('BLUE-EW')
--blueIADS:activate()
--blueIADS:addRadioMenu()

--local iadsDebug = blueIADS:getDebugSettings()
--iadsDebug.IADSStatus = true
--iadsDebug.contacts = true

end