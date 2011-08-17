# -*- coding: UTF-8 -*-

require 'active_support/core_ext/object/blank'

class JoinNotice
  include Cinch::Plugin
  
  set(
    plugin_name: "Auto Notice",
    help: "Notices nicks upon join.\nUsage: !hello to reply entry notice.",
    required_options: [:greetings, :filext])
  
  def get_channel_greeting channel
    open([config[:greetings], channel, config[:filext]].join, &:read) rescue nil
  end
  
  listen_to :join
  match /hello$/, method: :listen
  def listen(m)
    unless m.user.nick == bot.nick
      notice = get_channel_greeting m.channel.name
      if !notice.blank?
        m.user.notice(notice)
      end
    end
  end

end