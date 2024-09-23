Name:           simple
Version:        0.0.1
Release:        1%{?dist}
Summary:        Some summary

License:        Apache 2.0
URL:            http://example.com/%{name}
Source0:        http://example.com/%{name}/releases/%{name}-%{version}.tar.gz


%description
A demo RPM build

%prep
%setup

%install
mkdir -p %{buildroot}/%{_bindir}
install -m 0755 %{name} %{buildroot}/%{_bindir}/%{name}


%files
%{_bindir}/%{name}

%changelog
* Mon Sep 23 2024 shamilovstas
- 0.0.1