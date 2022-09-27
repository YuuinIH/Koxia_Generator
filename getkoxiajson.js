
import YAML from 'yaml'
import { readFileSync,writeFileSync } from 'fs'

const yaml = readFileSync('./koxia.yaml', 'utf8')
const json = YAML.parse(yaml)
const stringified = JSON.stringify(json, null, 2)
writeFileSync('./koxia.json', stringified)