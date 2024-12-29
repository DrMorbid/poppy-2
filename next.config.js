/**
 * @type {import('next').NextConfig}
 */
const nextConfig = { output: "export", compiler: { removeConsole: { exclude: ["error"] } } };

module.exports = nextConfig;
