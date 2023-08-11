import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ length: 100, unique: true })
    email: string;

    @Column({ length: 50, unique: true })
    username: string;

    @Column({ type: 'datetime', nullable: true })
    last_activity: Date;

    @Column()
    password: string;
}