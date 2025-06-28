local chat      = require("core.chat")
local command   = require('core.command')
local party     = require('party')
local resources = require('resources')
local spells    = resources.spells
local player    = require("player")

local trusts    = command.new('trusts')

local function check_is_trust(name)
  for _, spell in pairs(spells) do
    if spell.party_name ~= nil and spell.party_name == name then
      return true, spell.en
    end
  end
  return false, ""
end

local function get_trust_names()
  chat.add_text('Adding trusts to group called "name"')
  for i, member in pairs(party) do
    if member ~= nil and type(i) ~= "string" then
      if member.id ~= party.alliance.party_1_leader_id then
        local found, name = check_is_trust(member.name)
        if found then
          chat.add_text(name)
        end
      end
    end
  end
end

local function save_list(name)
  if player.id ~= party.alliance.party_1_leader_id then
    print("player must be party leader")
    return
  end
  get_trust_names()
end

local function list_groups()

end

trusts:register('save', save_list, command.arg.parse('<name:string>'))


--[[
Copyright © 2018, 2025 ActualCannibalPanda
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of ActualCannibalPanda nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Chiaia BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
