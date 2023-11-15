# Installing Proxmox

## Prepare Installation Media

- Download the latest installer ISO from [here](https://www.proxmox.com/en/downloads/category/iso-images-pve)
- Prepare an empty USB flash drive to install from (must have at least 1gb of space)
- Use [Etcher](https://www.balena.io/etcher#download-etcher) to prepare the flash drive with the Proxmox installer
  - Connect the flash drive to your computer. Ensure that all files have been deleted and backed up to avoid data loss.
  - Open Etcher. Select the flash drive and the ISO to prepare the installer
  - Once Etcher has finished, remove the flash drive from the USB port on your computer and connect it to an open USB port on your new Proxmox server

## Using the Proxmox VE Installer

Proxmox uses a menu-based GUI installer. Follow these steps to boot into the Proxmox Installer:

- Press <kbd>Esc</kbd> during startup (boot)
- Use the arrow keys to select the boot menu and press <kbd>Enter</kbd>
- Use the arrow keys to select the USB flash drive where the installer is located and press <kbd>Enter</kbd>

Once the system boots into the Proxmox installer, use the keyboard to select **Install Proxmox VE**:

![](https://ostechnix.com/wp-content/uploads/2022/03/Proxmox-installer-welcome-screen.png.webp ':size=50%')

> It’s possible to use the installation wizard with a keyboard only. Buttons can be clicked by pressing the ALT key combined with the underlined character from the respective button. For example, ALT + N to press a Next button.

---

Accept the EULA.

![](https://ostechnix.com/wp-content/uploads/2022/03/Accept-license-agreement.png ':size=50%')

---

After accepting the EULA, the prompt to select the target hard disk(s) will appear. Select the main hard disk on the machine.

![](https://ostechnix.com/wp-content/uploads/2022/03/Choose-target-drive.png.webp ':size=50%')

---

Next, configure basic system options such as location, time zone, and keyboard layout. The location is used to select a download server close by to speed up updates. The installer usually auto-detects these settings. They only need to be changed in the rare case that auto detection fails or a different keyboard layout should be used.

![](https://ostechnix.com/wp-content/uploads/2022/03/Choose-location-and-timezone.png.webp ':size=50%')

---

Next the password of the superuser (root) and an email address needs to be specified. Use a very strong password.

The email address is used for the purpose of sending notifications to the system administrator.

![](https://ostechnix.com/wp-content/uploads/2022/03/Provide-administration-password-and-Email-address.png.webp ':size=50%')

---

The final step is network configuration. Enter hostname, ip address, netmask, gateway, and DNS..

![](https://ostechnix.com/wp-content/uploads/2022/03/Network-configuration.png.webp ':size=50%')

| Option     | Explaination                                                    |
| ---------- | --------------------------------------------------------------- |
| Hostname   | Must be a FQDN, but does not need to be a domain you own        |
| IP Address | Set a static IP address with a mask of 24 (`192.168.254.10/24`) |
| Gateway    | IP address of your router (`192.168.254.254`)                   |
| DNS Server | IP address of your DNS server (`1.1.1.1`)                       |

---

You will see the summary of installation. Ensure that the "Automatically reboot after successful installation" option is not checked. If it is OK for you, click `Next` to start Proxmox installation. Or, simply click `Previous` button to go back and change the values accordingly.

![](https://ostechnix.com/wp-content/uploads/2022/03/Proxmox-installation-summary.png.webp ':size=50%')

---

Click `Install`. Now, the Proxmox installation process will begin. It will take a few minutes to complete. The installation starts to format disks and copies packages to the target. Please wait until this step has finished; then remove the installation medium and restart your system.

![](https://ostechnix.com/wp-content/uploads/2022/03/Installing-Proxmox.png.webp ':size=50%')

# Install Updates

## No Subscription Repository Configuration

The default Proxmox VE upgrade settings point to enterprise repositories. So, when you run software upgrades using the run dist upgrade command you may see the error that you are running PVE no subscription.

SSH into your Proxmox server. Login as `root` using the password you setup during installation.

```shell
ssh root@192.168.254.10
```

To receive updates, edit `/etc/apt/sources.list`

```shell
nvim /etc/apt/sources.list
```

Edit the file to look like this:

```sources.list
deb http://ftp.debian.org/debian bookworm main contrib

deb http://ftp.debian.org/debian bookworm-updates main contrib

# security updates
deb http://security.debian.org/debian-security bookworm-security main contrib

# PVE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

```

Edit `/etc/apt/sources.list.d/pve-enterprise.list`

```shell
nvim /etc/apt/sources.list.d/pve-enterprise.list
```

```pve-enterprise.list
# deb https://enterprise.proxmox.com/debian/pve bookworm pve-enterprise
```

## Run Updates

```shell
apt-get update
```

```shell
apt dist-upgrade
```

```shell
reboot
```

## Remove Nag

By default, Proxmox will nag you each time you open the web console to buy the enterprise product. To fix this, apply the following changes.

```shell
cd /usr/share/javascript/proxmox-widget-toolkit
```

First, we'll make a backup of the original JS file in case we want to revert our changes at a later time.

```shell
cp proxmoxlib.js proxmoxlib.js.bak
```

Now, we'll edit the file

```shell
nvim proxmoxlib.js
```

Using nvim, search for "No valid subscription"

Find the section of code that looks like this:

```js
Ext.Msg.show({
  title: gettext('No valid subscription'),
```

and update it to look like this:

```js
void({ //Ext.Msg.show({
  title: gettext('No valid subscription'),
```

Then restart the Proxmox web service

```shell
systemctl restart pveproxy.service
```

## Install Darkmode Theme

Before you get any real work done with Proxmox, you'll need to install dark mode. Lucky for you, there's a super easy one-liner!

```shell
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
```

# Configuring Proxmox

Further configuration is done via the Proxmox web interface. Point your browser to Port 8006 on the IP address given during installation (https://192.168.254.10:8006).

> Default login is `root` (realm PAM) and the root password was defined during the installation process.

# Install Ubuntu Cloud Image

## Prepare the Image

SSH into your Proxmox server. Login as `root` using the password you setup during installation.

```shell
ssh root@192.168.254.10
```

Install the necessary tools for customizing virtual images

```shell
apt-get install libguestfs-tools
```

Download the Ubuntu Server image:

```shell
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
```

Customize the image by adding the qemu-guest-agent package

```shell
virt-customize -a jammy-server-cloudimg-amd64.img --firstboot-install "qemu-guest-agent,git,neovim"
```

Create a new virtual machine

```shell
qm create 8000 --memory 4096 --core 1 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
```

Import the downloaded Ubuntu disk to local-lvm storage

```shell
qm importdisk 8000 jammy-server-cloudimg-amd64.img local-lvm
```

Attach the new disk to the vm as a scsi drive on the scsi controller

```shell
qm set 8000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-8000-disk-0
```

Add cloud init drive

```shell
qm set 8000 --ide2 local-lvm:cloudinit
```

Make the cloud init drive bootable and restrict BIOS to boot from disk only

```shell
qm set 8000 --boot c --bootdisk scsi0
```

Add serial console

```shell
qm set 8000 --serial0 socket --vga serial0
```

**Do not start your VM!**

## Cloud Init Configuration

Now, configure hardware and cloud init, then create a template and clone. If you want to expand your hard drive you can on this base image before creating a template or after you clone a new machine. I prefer to expand the hard drive after I clone a new machine based on need.
