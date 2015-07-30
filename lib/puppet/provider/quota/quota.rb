Puppet::Type.type(:quota).provide(:quota) do
  desc "Sets the quota on any given user or group"

  commands :quota => "setquota"
  commands :repquota => "repquota"

  def create
    quota(-u,"#{@resource[:name]}","#{@resource[:block_soft_limit]}","#{@resource[:block_hard_limit]}","#{@resource[:inode_soft_limit]}","#{@resource[:inode_hard_limit]}","#{@resource[:filesystem]}")
  end

  def destroy
    quota(-u,"#{@resource[:name]}",0,0,0,0,"#{@resource[:filesystem]}")
  end

  def exists?
    repquota(-u,"#{@resource[:name]}","#{@resource[:filesystem]}")
  end
end
