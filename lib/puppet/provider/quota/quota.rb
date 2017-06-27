Puppet::Type.type(:quota).provide(:quota) do
  desc "Sets the quota on any given user(id) or group(id)"

  commands :setquota => "quotatool"
  commands :repquota => "quota"

  def create
    setquota("-u", "#{@resource[:name]}",'-b','-q',"#{@resource[:block_soft_limit]}",'-l',"#{@resource[:block_hard_limit]}","#{@resource[:filesystem]}")
    setquota("-u", "#{@resource[:name]}",'-i','-q',"#{@resource[:inode_soft_limit]}",'-l',"#{@resource[:inode_hard_limit]}","#{@resource[:filesystem]}")
  end

  def destroy
    setquota("-u", "#{@resource[:name]}",'-b','-q',0,'-l',0,"#{@resource[:filesystem]}")
    setquota("-u", "#{@resource[:name]}",'-i','-q',0,'-l',0,"#{@resource[:filesystem]}")
  end

  def exists?
    cmd = [command(:repquota), '-u', "#{@resource[:name]}"].join(' ')
    out = execute(cmd, {:failonfail => true, :override_locale => true, :squelch => false, :combine => true})
    if out.include? "none"
      return false
    else
      return true
    end
  end

end
