# oss-audit-[24BCE10326]

**Name:** Ujjawal Pandey
**Register No:** 24BCE10326
**Course:** Open Source Software | VIT
**Chosen Software:** Git

---

## Overview of the Repository

This project is a capstone assignment for the Open Source Software course. The objective is to select an open-source project and study it in depth—not just its functionality, but also its purpose, origin, licensing, and overall ecosystem. Alongside the report, five shell scripts are developed to demonstrate practical understanding of Linux concepts.

The chosen project is **Git**, primarily due to its compelling origin story. It was created by Linus Torvalds in response to the Linux kernel team losing access to a proprietary tool (BitKeeper). Within a short span, he developed Git as a powerful alternative, which has since become an essential tool used globally by developers. This reflects the true spirit of open source innovation.

The report explores Git’s GPL v2 license (a copyleft license), the ethical dimensions of open source, its role within a Linux environment, its surrounding ecosystem, and comparisons with proprietary platforms like GitHub and older systems such as SVN.

---

## The Five Scripts

### script1_system_identity.sh

**Function:** Displays a system summary similar to a welcome screen, including OS name, kernel version, current user, home directory, uptime, date/time, and license-related information.

**Concepts Covered:** Variables, `echo`, command substitution `$()`, parsing `/etc/os-release`, formatting output

**Execution:**

```bash
chmod +x script1_system_identity.sh
./script1_system_identity.sh
```

---

### script2_package_inspector.sh

**Function:** Verifies whether Git is installed, retrieves version and license details using the package manager, and outputs a message using a `case` statement based on the package.

**Concepts Covered:** `if-then-else`, `case`, `dpkg -s` / `rpm -qi`, piping with `grep`

**Execution:**

```bash
chmod +x script2_package_inspector.sh
./script2_package_inspector.sh
```

---

### script3_disk_auditor.sh

**Function:** Iterates through key system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and displays permissions, ownership, and disk usage. It also checks Git’s configuration file and explains the importance of secure permissions.

**Concepts Covered:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`

**Execution:**

```bash
chmod +x script3_disk_auditor.sh
./script3_disk_auditor.sh
```

---

### script4_log_analyzer.sh

**Function:** Accepts a log file path and keyword as input, scans the file line by line, counts matching entries, and displays the last five matches. Includes retry logic if the file is missing.

**Concepts Covered:** `while read`, `if-then`, counters, command-line arguments (`$1`, `$2`), `grep`, `tail`

**Execution:**

```bash
chmod +x script4_log_analyzer.sh

# Example usage
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/auth.log "Failed"
./script4_log_analyzer.sh /var/log/messages warning
```

---

### script5_manifesto_generator.sh

**Function:** Prompts the user with three questions and generates a personalized open-source philosophy statement, saving it as a `.txt` file named after the user.

**Concepts Covered:** `read`, string concatenation, file writing (`>` and `>>`), `date`, alias usage (in comments)

**Execution:**

```bash
chmod +x script5_manifesto_generator.sh
./script5_manifesto_generator.sh
```

---

## Dependencies

All scripts are designed to run on a standard Linux environment without requiring additional installations.

For full functionality of script 2, Git should be installed:

```bash
# Ubuntu/Debian
sudo apt install git

# Fedora/RHEL
sudo dnf install git
```

For script 4, ensure a valid log file is available. If `/var/log/syslog` is not present, alternatives include `/var/log/kern.log` or `/var/log/auth.log`.

---

## Running All Scripts (Optional)

```bash
# Clone repository
git clone https://github.com/[yourusername]/oss-audit-24bce10843
cd oss-audit-24bce10843

# Make scripts executable
chmod +x *.sh

# Execute scripts
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_auditor.sh
./script4_log_analyzer.sh /var/log/syslog error
./script5_manifesto_generator.sh
```

---

## Report Details

The complete 12–16 page report is submitted separately and includes:

* **Part A:** Git’s origin, GPL v2 license analysis, and open source ethics
* **Part B:** Git’s structure and behavior within a Linux system
* **Part C:** The Git ecosystem (GitHub, GitLab, libgit2, Gitea, etc.)
* **Part D:** Comparison with proprietary and legacy tools (SVN, Perforce, Azure DevOps)
