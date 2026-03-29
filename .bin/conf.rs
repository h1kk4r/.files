use std::env;
use std::path::Path;
use std::process::Command;

fn ansi(style: u8, color: u8) -> String {
    format!("\x1b[{};{}m", style, color)
}

fn run(cmd: &str, args: &[&str]) -> Option<String> {
    let output = Command::new(cmd).args(args).output().ok()?;
    if !output.status.success() {
        return None;
    }

    let text = String::from_utf8_lossy(&output.stdout).trim().to_owned();
    if text.is_empty() {
        None
    } else {
        Some(text)
    }
}

fn kernel() -> String {
    run("uname", &["-s", "-r"]).unwrap_or_else(|| "Unknown".to_owned())
}

fn os_name() -> String {
    let product = run("sw_vers", &["-productName"]);
    let version = run("sw_vers", &["-productVersion"]);

    match (product, version) {
        (Some(product), Some(version)) => format!("{product} {version}"),
        (Some(product), None) => product,
        _ => env::consts::OS.to_owned(),
    }
}

fn shell() -> String {
    env::var("SHELL")
        .ok()
        .and_then(|path| {
            Path::new(&path)
                .file_name()
                .map(|name| name.to_string_lossy().into_owned())
        })
        .unwrap_or_else(|| "unknown".to_owned())
}

fn main() {
    let red = ansi(0, 31);
    let green = ansi(0, 32);
    let blue = ansi(0, 34);
    let white = ansi(0, 37);
    let reset = "\x1b[0m";

    println!();
    println!("  (\\ /)    {red}  kr{white} {}{reset}", kernel());
    println!("  ( · ·)   {blue}  os{white} {}{reset}", os_name());
    println!("  c({red}\"{white})({red}\"{white})  {green}  sh{white} {}{reset}", shell());
    println!();
}
