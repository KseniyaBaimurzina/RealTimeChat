import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { User } from 'src/user/user.entity';
import { Dialogue } from 'src/dialogue/dialogue.entity';
import { Message } from 'src/message/message.entity';

const typeOrmConfig: TypeOrmModuleOptions = {
    type: 'mysql',
    host: process.env.MYSQL_HOSTNAME,
    port: parseInt(process.env.MYSQL_PORT, 10),
    username: process.env.MYSQL_USER,
    password: process.env.MYSQL_USER_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    entities: [User, Dialogue, Message],
    synchronize: true,
};

export default typeOrmConfig;