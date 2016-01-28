$fuel_settings = parseyaml(file('/etc/compute.yaml'))
$qemu_version = "1:2.4+dfsg-4ubuntu1"
if $operatingsystem == 'Ubuntu' {
        if $fuel_settings['fuel-plugin-qemu']['use_kvm'] {
                package { 'linux-headers-4.1.10-rt10nfv':
                        ensure => "1.0.OPNFV",
                } ->
                package { 'linux-image-4.1.10-rt10nfv':
                        ensure => "1.0.OPNFV",
                } ->
                exec {'reboot':
                       command => "reboot",
                       path   => "/usr/bin:/usr/sbin:/bin:/sbin",
                }
        } else {
        }
} elsif $operatingsystem == 'CentOS' {
}
