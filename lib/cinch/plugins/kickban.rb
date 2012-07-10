# -*- coding: utf-8 -*-
require_relative "../helpers/check_user"

module Cinch
  module Plugins
    class Kickban
      include Cinch::Plugin
      set plugin_name: "Kickban", help: %{Various commands used for kickbanning users.
  Usage: `!moon [nick]` -- kicks the selected user with a My Little Pony: Friendship Is Magic-themed kick reason.
  Usage: `!sun [nick]` -- Kickbans the selected user [MLP-themed]
  Usage: `!banana [nick]` -- Kicks too. Don't ask.
  Usage: `!crp [nick]` -- Also kicks too. Don't ask, as well.
  Usage: `!fus [nick]` -- I really need to come up with a better solution for this.}, react_on: :channel

      match /moon (.+)/, method: :moonkick
    	def moonkick(m, nick)
    		return unless check_user(m.channel, m.user)
    		baddie = User(nick);
    		#m.channel.ban(baddie.mask("*!*@%h"));
    		m.channel.kick(nick, "#{m.user.nick} banishes #{baddie.nick} to the moon for 1000 years!");
    	end

      match /sun (.+)/, method: :sunban
      def sunban(m, nick)
        return unless check_user(m.channel, m.user)
        baddie = User(nick);
        m.channel.ban(baddie.mask("*!*@%h"));
        m.channel.kick(nick, "#{m.user.nick} banishes #{baddie.nick} to the sun, " + Format(:bold,"PERMANENTLY!"));
      end

      match /banana (.+)/, method: :bananakick
      def bananakick(m, nick)
        return unless check_user(m.channel, m.user)
        baddie = User(nick);
        m.channel.kick(nick, "#{m.user.nick} banishes #{baddie.nick} TO THE MOOOOOOOOOOOOOOOOOOOOONAAAAAAAAAAAAAAA BEEEYATCH!!!");
      end


      match /crp (.+)/, method: :crpkick
      def crpkick(m, nick)
        return unless check_user(m.channel, m.user)
        baddie = User(nick);
        m.channel.kick(nick, "gb2/#crrp/");
      end

      match /fus (.+)/, method: :fuskick
      def fuskick(m, nick)
        return unless check_user(m.channel, m.user)
        baddie = User(nick);
        m.channel.kick(nick, "FUS RO DAH!");
      end

    end
  end
end