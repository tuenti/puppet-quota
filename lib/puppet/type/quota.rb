Puppet::Type.newtype(:quota) do
  @doc = "Manage the quotas of system users"
  ensurable

  newparam(:name) do
    desc "The user or group on which quota needs to be set"
    isnamevar
  end

  newparam(:type) do
    desc "Set quota on user or group"
    newvalues(:user, :group)
    defaultto :user
  end

  newparam(:filesystem) do
    desc "The filesystem where the user resides"
  end

  newparam(:remote) do
    desc "Is  the filesystem on a remote server or not"
    newvalues(:true, :false)
  end

  newparam(:block_hard_limit) do
    desc "Hard limit block size"
    newvalues(/\d+/)
  end

  newparam(:block_soft_limit) do
    desc "Soft limit block size"
    newvalues(/\d+/)
  end

  newparam(:inode_hard_limit) do
    desc "Hard limit inode"
    newvalues(/\d+/)
  end

  newparam(:inode_soft_limit) do
    desc "Soft limit inode"
    newvalues(/\d+/)
  end
end
